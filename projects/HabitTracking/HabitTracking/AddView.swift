//
//  AddView.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/13.
//

import SwiftUI

struct MaxWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        let nextValue = nextValue()
        
        guard nextValue > value else { return }
        
        value = nextValue
    }
}

struct AddView: View {
    
    private enum Field: Hashable {
        case title
    }
    
    @State var maxLabelWidth: CGFloat = .zero
    
    @StateObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var color = Color.orange
    @State private var goal = 100
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextField("Title", text: $title)
                            .focused($focusedField, equals: .title)
                    }
                    .listRowBackground(Color.systemGray4)
                    .listRowSeparator(.hidden)
                }
                
                Section {
                    HStack {
                        ForEach(activities.themes, id: \.self) { color in
                            Button {
                                print("tap")
                                self.color = color
                            } label: {
                                Image(systemName: self.color==color ? "checkmark.circle.fill" : "circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(color)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .accessibilityLabel(activities.themesLabel[color, default: "Unknown Color"])
                            .accessibilityHint(self.color==color ? "selected" : "unselected")
                            
                        }
                    }
                    .listRowBackground(Color.systemGray5)
                    .listRowSeparator(.hidden)
                    
                }
                
                Section {
                    HStack {
                        Stepper("\(goal) Days", value: $goal, in: 50...150, step: 5)
                    }
                    .listRowBackground(Color.systemGray5)
                    .listRowSeparator(.hidden)
                    .accessibilityElement()
                    .accessibilityLabel("Habit goal days")
                    .accessibilityValue("\(String(goal)) days")
                    .accessibilityAdjustableAction { direction in
                        switch direction {
                        case .increment:
                            if (goal < 150) {
                                goal += 5
                            }
                        case .decrement:
                            if (goal > 50) {
                                goal -= 5                                
                            }
                        default:
                            print("Not handled")
                        }
                    }
                }
            }
            .navigationTitle("New habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.systemGray)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        submit()
                    }
                    .font(.headline)
                    .foregroundColor(.systemGray)
                    .disabled(title.isEmpty)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        focusedField = nil
                    }
                }
            }
        }
        
    }
    
    func submit() {
        dismiss()
        activities.items.append(ActivityItem(title: title, color: color, goal: goal))
    }
    
    init(activities: Activities) {
        UITableView.appearance().backgroundColor = .systemGray5
        UITableView.appearance().sectionFooterHeight = 4
        UITableView.appearance().sectionHeaderHeight = 4
        
        _activities = StateObject(wrappedValue: activities)
    }

}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AddView(activities: Activities())
        }
        .preferredColorScheme(.dark)
    }
}

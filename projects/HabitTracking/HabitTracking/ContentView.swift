//
//  ContentView.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/13.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var activities = Activities()
    @State private var showingAddActivities = false
    var sevenDayComponents: [DateComponents] {
        var tempArray = [DateComponents]()
        
        for i in -6...0 {
            let date = Calendar.current.date(byAdding: .day, value: i, to: Date.now)
            
            guard let unwrappedDate = date else {
                continue
            }
            let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .weekday], from: unwrappedDate)
            tempArray.append(dateComponent)
        }
        
        return tempArray
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(activities.items) { item in
                        VStack {
                            NavigationLink {
                                DetailView(item: item, activities: activities)
                            } label: {
                                HStack {
                                    Text(item.title)
                                        .fontWeight(.medium)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Image(systemName: "arrow.right.circle")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.bottom, 8)
                            }
                            .accessibilityHint("check detail of \(item.title)")
                            
                            HStack(spacing: 10) {
                                ForEach(sevenDayComponents, id: \.self) { day in
                                    DayButtonView(item: item, day: day, activities: activities)
                                }
                            }
                        }
                        .padding()
                        .background(.systemGray5)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
//                        activities.items.append(ActivityItem(name: "Test", description: "heyheyhey"))
                        showingAddActivities = true
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle")
                            Text("New habit")
                        }
                        .accessibilityHidden(true)
                    }
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 30)
                    .accessibilityLabel("Add new habit")
                    
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Habit Tracking")
            .background(.systemGray6)
            .sheet(isPresented: $showingAddActivities) {
                AddView(activities: activities)
            }
            
        }
//        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}

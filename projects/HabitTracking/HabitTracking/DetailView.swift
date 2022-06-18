//
//  DetailView.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/15.
//

import SwiftUI

struct DetailView: View {
    
    let item: ActivityItem
    
    @StateObject var activities: Activities
    @State private var showingDeleteAlert = false
    
    var totalDays: Int {
        item.goal
    }
    
    var doneDays: Int {
        item.days.count
    }
    
    var dateArray: [Date] {
        return item.days.map { Calendar.current.date(from: $0) ?? Date.now }
    }
    
    var missedDays: Int {
        let minDate = dateArray.min()
        guard let unwrappedMinDate = minDate else {
            return 0
        }
        
        let allDays = Calendar.current.dateComponents([.day], from: unwrappedMinDate, to: Date.now).day
        guard let unwrappedAllDays = allDays else {
            return 0
        }
        
        let result = unwrappedAllDays - item.days.count
        if result > 0 {
            return result
        } else {
            return 0
        }
    }
    
    var donePercentage: Double {
        return Double(doneDays) / Double(item.goal)
    }
    
    var yearString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let result = formatter.string(from: Date.now)
        return result
    }
    
    var body: some View {
        GeometryReader { proxy in
            List {
                Section {
                    HStack {
                        ProgressCircleView(percentage: donePercentage, color: item.color)
                            .accessibilityElement()
                            .accessibilityLabel("\(donePercentage.formatted(.percent)) Completed")
                        
                        Spacer()
                        
                        InfoCellView(title: "done", content: doneDays)
                        InfoCellView(title: "missed", content: missedDays)
                        InfoCellView(title: "days", content: totalDays, isLast: true)
                    }
                    .padding()
                    .listRowBackground(Color.systemGray5)

                }
                
                Section {
                    VStack {
                        HStack {
                            Text("Statistic")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                            Text(yearString)
                                .font(.caption)
                        }
                        .padding(.bottom, 6)
                        .accessibilityElement()
                        .accessibilityLabel("Statistic of \(yearString)")
                        
                        ChartView(width: proxy.size.width - 64, height: (proxy.size.width) * 0.4, item: item)
                    }
                    .padding(.vertical, 10)
                    .listRowBackground(Color.systemGray5)
                }
                
                Section {
                    Button("Delete", role: .destructive) {
                        showingDeleteAlert = true
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowBackground(Color.systemGray5)
                }
            }
            .listStyle(.insetGrouped)
            
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete \(item.title)?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive) { delete() }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This habit will be deleted permanently.")
        }
        
    }
    
    init(item: ActivityItem, activities: Activities) {
        UITableView.appearance().backgroundColor = .systemGray6
//        UITableView.appearance().sectionFooterHeight = 4
//        UITableView.appearance().sectionHeaderHeight = 4
        
        _activities = StateObject(wrappedValue: activities)
        self.item = item
    }
    
    func delete() {
        let index = activities.items.firstIndex(of: item)

        guard let unwrappedIndex = index else {
            return
        }
        activities.items.remove(at: unwrappedIndex)
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var days: Set<DateComponents> {
        var tempArray = Set<DateComponents>()
        for _ in 0...85 {
            let date = Calendar.current.date(byAdding: .day, value: Int.random(in: -1000...0), to: Date.now)
            
            guard let unwrappedDate = date else {
                continue
            }
            
            let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .weekday], from: unwrappedDate)
            tempArray.insert(dateComponent)
        }
        return tempArray
    }
    
    static let item = ActivityItem(title: "Mediation", color: .orange, goal: 100, days: days)
    static let activities = Activities()
    
    static var previews: some View {
        NavigationView {
            DetailView(item: item, activities: activities)
        }
        .preferredColorScheme(.dark)
        
    }
}

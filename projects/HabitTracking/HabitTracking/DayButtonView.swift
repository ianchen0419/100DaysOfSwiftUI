//
//  DayButtonView.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/15.
//

import SwiftUI

struct DayButtonView: View {
    let item: ActivityItem
    let day: DateComponents

    @State private var isSelected = false
    @ObservedObject var activities: Activities
    
    var isPreselected: Bool {
        item.days.contains(day)
    }
    
    var date: Date {
        let date = Calendar.current.date(from: day)
        guard let unwrappedDate = date else {
            return Date.now
        }
        return unwrappedDate
    }

    func ClickDay(_ day: DateComponents) {
        let index = activities.items.firstIndex(of: item)

        guard let unwrappedIndex = index else {
            return
        }

        var tempDays = item.days
        tempDays.insert(day)

        activities.items[unwrappedIndex].days = tempDays
        isSelected = true
    }

    var formatDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }

    var formatWeekday: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter.string(from: date)
    }
    
    var voiceDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM"
        return formatter.string(from: date)
    }
    
    var body: some View {
        Button {
            ClickDay(day)
        } label: {
            VStack(spacing: 5) {
                Text(formatWeekday)
                    .font(.caption)
                    .foregroundColor(.secondary)
                ZStack {
                    Circle()
                        .fill(isSelected || isPreselected ? item.color : .systemGray4)
                    Text(formatDay)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .frame(height: 30)
            }
            .accessibilityHidden(true)
        }
        .foregroundColor(.primary)
        .accessibilityLabel(voiceDay)
        .accessibilityHint(isSelected || isPreselected ? "marked" : "unmarked")
    }
}

struct DayButtonView_Previews: PreviewProvider {
    static let day = Calendar.current.dateComponents([.year, .month, .day, .weekday], from: Date.now)
    static let item = ActivityItem(title: "Mediation", color: .purple, goal: 40)
    static let activities = Activities()
    
    static var previews: some View {
        DayButtonView(item: item, day: day, activities: activities)
            .previewLayout(.sizeThatFits)
    }
}

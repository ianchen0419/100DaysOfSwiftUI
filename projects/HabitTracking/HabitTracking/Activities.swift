//
//  Activities.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/13.
//

import Foundation
import SwiftUI

class Activities: ObservableObject {
    
    @Published var items = [ActivityItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
        
    let themes: [Color] = [.orange, .yellow, .green, .indigo, .purple, .brown, .gray]
    let themesLabel: [Color: String] = [
        .orange: "orange",
        .yellow: "yellow",
        .green: "green",
        .indigo: "indigo",
        .purple: "purple",
        .brown: "brown",
        .gray: "gray"
    ]
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

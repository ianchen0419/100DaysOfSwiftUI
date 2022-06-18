//
//  Activity.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/13.
//

import Foundation
import SwiftUI

struct ActivityItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let color: Color
    let goal: Int
    
    var days = Set<DateComponents>()
    
}

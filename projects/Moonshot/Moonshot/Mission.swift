//
//  Mission.swift
//  Moonshot
//
//  Created by Yi An Chen on 2022/2/8.
//

import Foundation

//struct CrewRole: Codable {
//    let name: String
//    let role: String
//}

struct Mission: Codable, Identifiable {
    
    //nested struct
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    func formattedLaunchDate(_ style: Date.FormatStyle.DateStyle) -> String {
        return launchDate?.formatted(date: style, time: .omitted) ?? "N/A"
    }
    
}

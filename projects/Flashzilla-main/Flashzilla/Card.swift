//
//  Card.swift
//  Flashzilla
//
//  Created by Yi An Chen on 2022/3/21.
//

import Foundation

struct Card: Equatable, Codable, Identifiable {
    let id: UUID
    let prompt: String
    let answer: String
    
    static let example = Card(id: UUID(), prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    static let savedPath = FileManager.documentsDirectory.appendingPathComponent("Cards")
    
    static func load() -> [Card] {
        do {
            let data = try Data(contentsOf: Self.savedPath)
            let cards = try JSONDecoder().decode([Card].self, from: data)
            return cards
        } catch {
            print("Unable to load data.")
            return []
        }
    }
    
    static func save(_ cards: [Card]) {
        do {
            let data = try JSONEncoder().encode(cards)
            try data.write(to: Self.savedPath, options: [.atomic])
        } catch {
            print("Unable to save data.")
        }
    }
    
}


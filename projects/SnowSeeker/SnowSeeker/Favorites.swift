//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Yi An Chen on 2022/3/26.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private let savePath = FileManager.documentDirectory.appendingPathComponent("Favorites")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            resorts = try JSONDecoder().decode(Set<String>.self, from: data)
        } catch {
            resorts = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: savePath, options: [.atomic])
        } catch {
            print("Unalbe to save data")
        }
    }
}

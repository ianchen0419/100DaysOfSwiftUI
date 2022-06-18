//
//  DataController.swift
//  Bookworm
//
//  Created by Yi An Chen on 2022/2/20.
//

import CoreData
import Foundation

// OberservaleObject: create when app launches, and stay alive for as long as app runs
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Yi An Chen on 2022/2/20.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            // managedObjectContext: when you load data and change data, those only exist in memory until you specifically say I'm done now, write it back to the persistent store to the iPhone's SSD
        }
    }
}

// reading data: effect request

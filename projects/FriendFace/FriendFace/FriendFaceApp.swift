//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Yi An Chen on 2022/3/5.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

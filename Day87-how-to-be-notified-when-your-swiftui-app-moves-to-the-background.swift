//
//  ContentView.swift
//  Flashzilla
//
//  Created by Yi An Chen on 2022/3/20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                    //visible but user can't access to our app, such as swipe up to down to pull out the notification screen, or multitasking mode
                } else if newPhase == .background {
                    print("Background")
                    //invisiable but app is still running
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

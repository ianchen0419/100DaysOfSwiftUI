//
//  ContentView.swift
//  HotProspects
//
//  Created by Yi An Chen on 2022/3/18.
//

import SwiftUI

struct ContentView: View {
    static let tag = "Two" // or "ContentView"
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
//                .tag("Two")
                .tag(ContentView.tag)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

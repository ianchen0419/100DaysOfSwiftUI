//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Yi An Chen on 2022/3/26.
//

import SwiftUI

// adaptive layout

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello, world!")
            }
            .navigationTitle("Primary")
            
            Text("Secondary")
            
            Text("Tertiary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

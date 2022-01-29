//
//  ContentView.swift
//  WeSplit
//
//  Created by Yi An Chen on 2022/1/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  WeSplit
//
//  Created by Yi An Chen on 2022/1/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCount = 0
    
    var body: some View {
        
        Text("Hello, world!")
            .padding()
        
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  WordScramble
//
//  Created by Yi An Chen on 2022/2/2.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        
//        List {
//
//            Section("Section 1") {
//                Text("Static row 1")
//                Text("Static row 2")
//            }
//
//
//
//            Section("Section 2") {
//                ForEach(0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//
//            Section("Section 3") {
//                Text("Static row 3")
//                Text("Static row 4")
//            }
//        }
//        .listStyle(.grouped)
        
        
//        List(0..<5) {
//            Text("Dynamic row \($0)")
//        }
//        .listStyle(.grouped)
        
        
        List(people, id: \.self) {
            Text($0)
        }
        .listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

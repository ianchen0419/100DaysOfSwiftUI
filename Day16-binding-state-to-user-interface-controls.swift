//
//  ContentView.swift
//  WeSplit
//
//  Created by Yi An Chen on 2022/1/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    
    var body: some View {
        
        Form {
            TextField("Enter your name", text: $name) //$ means also need to write back
            Text("Your name is \(name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Moonshot
//
//  Created by Yi An Chen on 2022/2/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

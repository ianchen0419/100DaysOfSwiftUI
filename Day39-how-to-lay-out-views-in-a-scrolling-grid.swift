//
//  ContentView.swift
//  Moonshot
//
//  Created by Yi An Chen on 2022/2/7.
//

import SwiftUI

struct ContentView: View {
    
//    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//    ]
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)), //at least 80 width
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

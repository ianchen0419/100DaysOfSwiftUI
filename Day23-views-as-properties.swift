//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yi An Chen on 2022/1/31.
//

import SwiftUI

struct ContentView: View {
    
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titilandus")
    
    var spells: some View {
        Group { //or VStack, HStack...
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    @ViewBuilder var spells2: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        
//        VStack {
//            motto1
//                .foregroundColor(.red)
//            motto2
//                .foregroundColor(.blue)
//        }
        
//        VStack {
//            spells
//        }
        
        spells2
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

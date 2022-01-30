//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yi An Chen on 2022/1/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            //system: red, blue, green, mint, indigo
            //sematic: primary, secondary(transparent)
//            Color(red: 1, green: 0.8, blue: 0)
//            Color.secondary
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Your content")
//                .foregroundColor(.secondary)
                .foregroundStyle(.secondary) //vibrance effect
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
        //also ignore keyboard area
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

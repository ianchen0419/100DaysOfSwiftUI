//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yi An Chen on 2022/1/31.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
                .blur(radius: 0) //invalid because 0 isn't geater than 5
                .blur(radius: 50) //valid
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        .blur(radius: 5)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

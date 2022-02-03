//
//  ContentView.swift
//  Animations
//
//  Created by Yi An Chen on 2022/2/3.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enabled = false
    
    var body: some View {
        
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
//        .animation(nil, value: enabled) //nil means change immediately
        .animation(.default, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        //changes occur before the animation modifer will get animated
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

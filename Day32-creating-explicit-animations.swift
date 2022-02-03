//
//  ContentView.swift
//  Animations
//
//  Created by Yi An Chen on 2022/2/3.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        
        Button("Tap Me") {
            withAnimation {
                animationAmount += 360
            }
//            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//                animationAmount += 360
//            }
            
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

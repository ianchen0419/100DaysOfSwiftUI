//
//  ContentView.swift
//  Animations
//
//  Created by Yi An Chen on 2022/2/3.
//

import SwiftUI

struct ContentView: View {
    
    @State var animationAmount = 1.0
    
    var body: some View {
        /*
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.easeOut, value: animationAmount)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
        //spring animation
        .animation(
            .easeInOut(duration: 2)
//                .delay(1),
//                .repeatCount(3, autoreverses: true),
                .repeatForever(autoreverses: true),
            value: animationAmount
        )
         */
        
        Button("Tap Me") {
            
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

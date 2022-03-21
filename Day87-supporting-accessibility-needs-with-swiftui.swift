//
//  ContentView.swift
//  Flashzilla
//
//  Created by Yi An Chen on 2022/3/20.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scale = 1.0
    
    var body: some View {
        // Reduce differentiate without color
//        HStack {
//            if differentiateWithoutColor {
//                Image(systemName: "checkmark.circle")
//            }
//
//            Text("Success")
//        }
//        .padding()
//        .background(differentiateWithoutColor ? .black : .green)
//        .foregroundColor(.white)
//        .clipShape(Capsule())
        
        // Reduce motion
//        Text("Hello, world!")
//            .scaleEffect(scale)
//        onTapGesture {
//            if reduceMotion {
//                scale *= 1.5
//            } else {
//                withAnimation {
//                    scale *= 1.5
//                }
//            }
//            withOptionalAnimation {
//                scale *= 1.5
//            }
//        }
        
        // Reduce transparency
        Text("Hello, world!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

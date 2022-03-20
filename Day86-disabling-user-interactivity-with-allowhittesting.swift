//
//  ContentView.swift
//  Flashzilla
//
//  Created by Yi An Chen on 2022/3/20.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped!")
//                }
//
//            Circle()
//                .fill(.red)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Circle tapped!")
//                }
//                .contentShape(Rectangle())
//                .allowsHitTesting(false) // disable from tap
//        }
        
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

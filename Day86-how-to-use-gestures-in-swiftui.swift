//
//  ContentView.swift
//  Flashzilla
//
//  Created by Yi An Chen on 2022/3/20.
//

import SwiftUI

struct ContentView: View {
    // Scale gesture
//    @State private var currentAmount = 0.0
//    @State private var finalAmount = 1.0
    
    // Rotation gesture
//    @State private var currentAmount = Angle.zero
//    @State private var finalAmount = Angle.zero
    
    // Gesture sequence
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
//        Text("Hello, world!")
//            .padding()
//            .onLongPressGesture(minimumDuration: 1) {
//                print("Long pressed!")
//            } onPressingChanged: { inProgress in
//                print("In progress: \(progress)")
//            }
//            .onLongPressGesture {
//                print("Long pressed!")
//            }
//            .onTapGesture(count: 2) {
//                print("Double tapped!")
//            }
        
        
        // Scale gesture
//        Text("Hello, world!")
//            .scaleEffect(currentAmount + finalAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { amount in
//                        currentAmount = amount - 1
//                    }
//                    .onEnded { amount in
//                        finalAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
        
        // Rotation gesture
//        Text("Hello, world!")
//            .rotationEffect(currentAmount + finalAmount)
//            .gesture(
//                RotationGesture()
//                    .onChanged { angle in
//                        currentAmount = angle
//                    }
//                    .onEnded { angle in
//                        finalAmount += currentAmount
//                        currentAmount = .zero
//                    }
//            )
        
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
        
        // Gesture priority
//        VStack {
//            Text("3")
//                .onTapGesture {
//                    print("Text tapped!") // Default: child gesture priority
//                }
//        }
//        .simultaneousGesture(
//            TapGesture()
//                .onEnded {
//                    print("VStack tagged!")
//                }
//        )
//        .highPriorityGesture(
//            TapGesture()
//                .onEnded {
//                    print("VStack tapped!")
//                }
//        )
//        .onTapGesture {
//            print("VStack tapped!")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

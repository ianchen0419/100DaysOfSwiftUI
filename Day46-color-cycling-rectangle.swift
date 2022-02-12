//
//  ContentView.swift
//  Drawing
//
//  Created by Yi An Chen on 2022/2/9.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    
    var amount = 0.0
    var steps = 100
    var pointX = 0.0
    var pointY = 0.0
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5),
                            ]),
                            startPoint: UnitPoint(x: pointX, y: pointY),
                            endPoint: UnitPoint(x: 1 - pointX, y: 1 - pointY)
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    
    @State private var colorCycle = 0.0
    @State private var pointX = 0.0
    @State private var pointY = 0.0
    
    var body: some View {
        
        Form {
            Section {
                ColorCyclingRectangle(amount: colorCycle, pointX: pointX, pointY: pointY)
                    .frame(width: 280, height: 280)
                    .padding()
                    .animation(.default, value: pointX)
                    .animation(.default, value: pointY)
            }
                
            
            Section("Color Cycle") {
                Slider(value: $colorCycle)
            }
            
            Section("Gradient Axis") {
                Stepper("\(pointX.formatted())x", value: $pointX, in: 0...1, step: 0.1)
                Stepper("\(pointY.formatted())y", value: $pointY, in: 0...1, step: 0.1)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

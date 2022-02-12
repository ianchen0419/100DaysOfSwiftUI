//
//  ContentView.swift
//  Drawing
//
//  Created by Yi An Chen on 2022/2/9.
//

import SwiftUI

struct Arrow: InsettableShape {

    var breakPoint: Double
    var thickness: Double
    var insetAmount = 0.0
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(breakPoint, thickness)
        }
        set {
            breakPoint = newValue.first
            thickness = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {

        var path = Path()

        path.move(to: CGPoint(x: rect.midX - thickness / 2, y: rect.maxY - insetAmount))
        path.addLine(to: CGPoint(x: rect.midX + thickness / 2, y: rect.maxY - insetAmount))
        path.addLine(to: CGPoint(x: rect.midX + thickness / 2, y: rect.height * breakPoint))
        
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.height * breakPoint))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + insetAmount))
        path.addLine(to: CGPoint(x: rect.minX + insetAmount, y: rect.height * breakPoint))
        path.addLine(to: CGPoint(x: rect.midX - thickness / 2, y: rect.height * breakPoint))
        path.closeSubpath()

        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct ContentView: View {
    
    @State private var breakPoint = 0.4
    @State private var thickness = 25.0
    
    var body: some View {
        
        Arrow(breakPoint: breakPoint, thickness: thickness)
            .strokeBorder(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 300)
            .overlay(Rectangle().stroke(.secondary))
            .onTapGesture {
                withAnimation {
                    breakPoint = Double.random(in: 0.2..<0.5)
                    thickness = Double.random(in: 25...50)
                }
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Drawing
//
//  Created by Yi An Chen on 2022/2/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path { path in
            //cg: core graphics
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.closeSubpath()
        }
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//        .stroke(.blue, lineWidth: 10)
//        .fill(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

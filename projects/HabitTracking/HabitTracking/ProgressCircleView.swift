//
//  ProgressCircleView.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/16.
//

import SwiftUI

struct ProgressCircleView: View {
    @State private var degreeAmount = 0.0
    
    let percentage: Double
    let color: Color
    
    
    var body: some View {
        ZStack {
            Circle()
//                .stroke(.systemGray4, lineWidth: 5)
                .stroke(color, lineWidth: 5)
                .opacity(0.2)
            Arc(endAngle: degreeAmount)
                .stroke(color, style: StrokeStyle(lineWidth: 5, lineCap: .round))
            Text(String(format: "%.1f", percentage * 10))
                .font(.subheadline)
        }
        .frame(width: 50, height: 50)
        .onAppear {
            withAnimation(.easeInOut(duration: 1)) {
                
                if percentage > 1 {
                    degreeAmount = 360
                } else {
                    degreeAmount = percentage * 360
                }
            }
        }
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(percentage: 0.554343434343, color: .purple)
            .previewLayout(.sizeThatFits)
    }
}

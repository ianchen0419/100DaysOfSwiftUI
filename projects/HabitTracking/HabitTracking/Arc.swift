//
//  Arc.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/16.
//

import Foundation
import SwiftUI

struct Arc: Shape {
    let startAngle: Angle = .degrees(0)
//    let endAngle: Angle
    var endAngle: Double
    let clockwise = true
    
    var animatableData: CGFloat {
        get { CGFloat(endAngle) }
        set { endAngle = Double(newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedeEnd = .degrees(endAngle) - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedeEnd, clockwise: !clockwise)
        
        return path
    }
    
}

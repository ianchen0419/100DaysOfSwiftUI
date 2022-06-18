//
//  Graph.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/16.
//

import Foundation
import SwiftUI

struct Graph: Shape {
    let data: [Double]
    
    func path(in rect: CGRect) -> Path {
        let distance = rect.width / 12
        let startX = distance / 2
        var path = Path()
        
        path.move(to: CGPoint(x: startX, y: rect.height * (1 - data[0])))
        for i in 1...11 {
            path.addLine(to: CGPoint(x: startX + distance * Double(i), y: rect.height * (1 - data[i])))
        }
       
        return path
    }
}

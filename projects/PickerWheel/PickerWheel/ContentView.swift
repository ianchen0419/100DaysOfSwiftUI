//
//  ContentView.swift
//  PickerWheel
//
//  Created by Yi An Chen on 2022/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var angle: CGFloat = 0
    @State private var lastAngle: CGFloat = 0
    @State private var staticAngle: CGFloat = 0
    @State private var isSpinning = false
    @State private var spinResult = -1
    @State private var sparkleColor = Color.pink
    @State private var timeCounter = 0
    @State private var divider = 3.0
    
    let timer = Timer.publish(every: 0.3, tolerance: 0.3, on: .main, in: .common).autoconnect()
    let length: CGFloat = 300
    let colors: [Color] = [.red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple]
    
    var angleDegree: Double { 360.0 / divider }

    var body: some View {
        
        VStack {
            ZStack(alignment: .top) {
                Canvas { context, size in
                    
                    let angleOffset: Double = -90
                    let radius = size.width / 2
                    let centerX = size.width / 2
                    let centerY = size.width / 2 + 7.5
                    
                    let center = CGPoint(x: centerX, y: centerY)
                    
                    for i in 1...Int(divider) {
                        let startAngle = angleOffset + angleDegree * Double(i - 1)
                        let endAngle = angleOffset + angleDegree * Double(i)
                        
                        let startX = centerX + radius * cos(startAngle * .pi / 180.0)
                        let startY = centerY + radius * sin(startAngle * .pi / 180.0)
                        let startCoordinate = CGPoint(x: startX, y: startY)
                        
                        let endX = centerX + radius * cos(endAngle * .pi / 180.0)
                        let endY = centerY + radius * sin(endAngle * .pi / 180.0)
                        let endCoordinate = CGPoint(x: endX, y: endY)
                        
                        var path = Path()
                        path.move(to: center)
                        path.addLine(to: startCoordinate)
                        path.addArc(center: center, radius: radius, startAngle: .degrees(startAngle), endAngle: .degrees(endAngle), clockwise: false)
                        path.addLine(to: endCoordinate)
                        path.closeSubpath()
                        
                        context.fill(path, with: .color(spinResult == i ? sparkleColor : colors[i % 10]))
                        
                        let textX = (centerX + startX + endX) / 3
                        let textY = (centerY + startY + endY) / 3
                        let textCoordinate = CGPoint(x: textX, y: textY)
                        
                        let text = Text(i.formatted()).font(.title).foregroundColor(.white)
                        context.draw(text, at: textCoordinate)
                    }
                        
                    
                }
                .frame(width: length, height: length + 15)
                .rotationEffect(.degrees(Double(angle + staticAngle)))
//                .rotationEffect(.degrees(331)) //underclockwise
                .allowsHitTesting(!isSpinning)
                .gesture(
                    DragGesture()
                    .onChanged{ value in
                        spinResult = -1
                        isSpinning = true
                        
                        var preAngle =  (atan2(value.location.x - length / 2, length / 2 - value.location.y) * 180 / .pi).rounded()
                        if preAngle < 0 { preAngle += 360 }
                        
                        withAnimation(.spring()) {
                            angle = preAngle + lastAngle
                            
                        }

                    }
                    .onEnded { value in
                        let velocity = value.predictedEndTranslation.height - value.translation.height
                        
                        withAnimation(.easeOut(duration: 5)) {
                            staticAngle += (Double.random(in: 6...12) * velocity).rounded()
                            if (angle + staticAngle).truncatingRemainder(dividingBy: angleDegree) == 0 {
                                staticAngle += 10
                            }
                        }
                        
                    }
                )
                .onAnimationCompleted(for: staticAngle) {
                    angle += staticAngle
                    lastAngle = angle
                    staticAngle = 0
                    
                    isSpinning = false
                    timeCounter = 0

                    let trimmedAngle = Double(angle).truncatingRemainder(dividingBy: 360)
                    var locationAngle = 0.0
                    if trimmedAngle > angleDegree {
                        locationAngle = (trimmedAngle / angleDegree).rounded(.down)
                    }
                    spinResult = Int(divider - locationAngle)
                    
                }
                .onReceive(timer) { time in
                    
                    if spinResult > 0 && timeCounter < 5 {

                        if timeCounter.isMultiple(of: 2) {
                            sparkleColor = .pink
                        } else {
                            sparkleColor = colors[spinResult % 10]
                        }
                        
                        timeCounter += 1
                        
                    }
                    
                }
                
                Image(systemName: "arrowtriangle.down.fill")
                    .font(.largeTitle)
                    .foregroundColor(.brown)
            }
            
            HStack {
                Text("\(divider.formatted()) slides")
                    .foregroundColor(.secondary)
                Slider(value: $divider, in: 3...18, step: 1)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

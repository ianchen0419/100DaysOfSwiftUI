//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Yi An Chen on 2022/3/22.
//

import SwiftUI

struct ContentView: View {
    func scaleValue(geo: GeometryProxy, fullView: GeometryProxy) -> Double {
        let distanceY = geo.frame(in: .global).midY - fullView.safeAreaInsets.top
        let percentageY = distanceY / fullView.size.height
        
        if distanceY > fullView.frame(in: .global).midY {
            return 1
        } else {
            let amount = percentageY + 0.5
            return amount
        }
    }
    
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(
                                hue: geo.frame(in: .global).minY / fullView.size.height ,
                                saturation: 1,
                                brightness: 1,
                                opacity: (geo.frame(in: .global).minY - fullView.safeAreaInsets.top) * 0.005
                            ))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .scaleEffect(scaleValue(geo: geo, fullView: fullView), anchor: .trailing)

                    }
                    .frame(height: 40)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

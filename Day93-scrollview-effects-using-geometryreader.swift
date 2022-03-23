//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Yi An Chen on 2022/3/22.
//

import SwiftUI

struct BoxView: View {
  
  @State var blueOffset:CGFloat = -90
  @State var blueDegree:Double = 180
  
  @State var redOffset: CGFloat = 0
  @State var redDegree:Double = 90
  
  @State var greenOffset:CGFloat = 90
  @State var greenDegree:Double = 90
  
  @State var orangeDegree: Double = 0
  @State var orangeOffset: CGFloat = 0
  
  var body: some View {
    VStack {
      Text("Run")
        .onTapGesture {
          withAnimation(.linear(duration: 16)) {
            self.blueDegree = 270
            self.blueOffset = 0
            
            self.redDegree = 180
            self.redOffset = 90
            
            self.greenDegree = 0
            self.greenOffset = 0
            
            self.orangeDegree = 90
            self.orangeOffset = -90
          }
      }
      ZStack {
        Spacer()
        ZStack {
          Text("6")
            .offset(.init(width: 24, height: 0))
          Rectangle()
            .stroke(Color.blue, lineWidth: 5)
            .opacity(0.2)
            .frame(width: 90, height: 90, alignment: .center)
        }.rotation3DEffect(.degrees(self.blueDegree), axis: (x: 0, y: -1, z: 0), anchor: UnitPoint.trailing, anchorZ: 0, perspective: -0.1)
          .offset(CGSize(width: blueOffset, height: 0))
        ZStack {
          Text("2")
            .offset(.init(width: -24, height: 0))
          Rectangle()
            .stroke(Color.red, lineWidth: 5)
            .opacity(0.2)
            .frame(width: 90, height: 90, alignment: .center)
        }.rotation3DEffect(.degrees(self.redDegree), axis: (x: 0, y: -1, z: 0), anchor: UnitPoint.leading, anchorZ: 0, perspective: -0.1)
        .offset(CGSize(width: redOffset, height: 0))
        Spacer()

        Spacer()
        ZStack {
          Text("5")
            .onTapGesture {
              print("greenDegree ",self.greenDegree)
              print("greenOffset ",self.greenOffset)
            }
            .offset(.init(width: 0, height: 24))
          Rectangle()
            .stroke(Color.green, lineWidth: 5)
            .opacity(0.9)
            .frame(width: 90, height: 90, alignment: .center)
        }.rotation3DEffect(.degrees(greenDegree), axis: (x: 0, y: 1, z: 0), anchor: UnitPoint.leading, anchorZ: 0, perspective: 0.1)
        .offset(CGSize(width: greenOffset, height: 0))
        ZStack {
          Text("1")
            .offset(.init(width: 0, height: -24))
          Rectangle()
            .stroke(Color.orange, lineWidth: 5)
            .opacity(0.9)
            .frame(width: 90, height: 90, alignment: .center)
        }.rotation3DEffect(.degrees(self.orangeDegree), axis: (x: 0, y: -1, z: 0), anchor: UnitPoint.trailing, anchorZ: 0, perspective: 0.1)
        .offset(x: orangeOffset, y: 0)
        
        Spacer()
      }
    }
  
  }
}

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
//        GeometryReader { fullView in
//            ScrollView {
//                ForEach(0..<50) { index in
//                    GeometryReader { geo in
//                        Text("Row #\(index)")
//                            .font(.title)
//                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
//                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
//                    }
//                    .frame(height: 40)
//                }
//            }
//        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { geo in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
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

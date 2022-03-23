//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Yi An Chen on 2022/3/22.
//
import SwiftUI

// coordinate spaces
// global name space: our views relative to the whole screen
// local name space: relative to its immediate parent
// custom coordinate space
struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            
            GeometryReader { geo in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                    }
            }
            .background(.orange)
            
            Text("Right")
        }
    }
}

struct ContentView: View {
    var body: some View {
        
//        VStack {
//            GeometryReader { geo in // flexible preferred size: expand to take up more space as needed
//                Text("Hello, world!")
//                    .frame(width: geo.size.width * 0.9)
//                    .background(.red)
//            }
//            .background(.green)
//
//            Text("More text")
//                .background(.blue)
//        }
        
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
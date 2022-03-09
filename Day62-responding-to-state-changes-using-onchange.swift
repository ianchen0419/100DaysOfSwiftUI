//
//  ContentView.swift
//  Instafilter
//
//  Created by Yi An Chen on 2022/3/9.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0
//    @State private var blurAmount = 0.0 {
//        didSet {
//            print("New value is \(blurAmount)")
//        }
//    }
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
            .onChange(of: blurAmount) { newValue in
                print("New value in \(newValue)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

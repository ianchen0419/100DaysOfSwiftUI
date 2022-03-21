//
//  ContentView.swift
//  Flashzilla
//
//  Created by Yi An Chen on 2022/3/20.
//

import SwiftUI

struct ContentView: View {
    // @Published: send change
    // @State: send change and reinvoke UI
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect() // tolerance: timer collapsing
    @State private var counter = 0
    
    var body: some View {
        Text("Hello, world!")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("Time time is now \(time)")
                }
                
                counter += 1
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Yi An Chen on 2022/3/22.
//

import SwiftUI

// absolute positioning: position modifier
// relative positioning: offset modifier

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
//            .position(x: 100, y: 100)
            .offset(x: 100, y: 100) // chaing location where it should render
            .background(.red) // parent do positioning
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

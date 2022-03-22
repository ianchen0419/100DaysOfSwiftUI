//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Yi An Chen on 2022/3/22.
//

import SwiftUI

// 1. A parent view proposes a size for its child.
// 2. Based on that information, the child then chooses its own size and the parent must respect that choice.
// 3. The parent then positions the child in its coordinate space.

struct ContentView: View {
    // layout neutral
    // body(layout neutral) -> BackgroundView(layout neutral) -> PaddingView -> TextView
    var body: some View {
        Text("Hello, world!")
            .padding(20) // subtract 20 points from each side to make sure there's enough space for its padding
            .background(.red) // order of modifier: bottom to top
    }
}
// Side effect
// 1. If the all views hierachy are layout neutral, the result will become whole screen

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Drawing
//
//  Created by Yi An Chen on 2022/2/9.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        Text("Hello, world!")
//            .frame(width: 300, height: 300)
//            .background(.red)
//            .border(.red, width: 30)
//            .background(Image("Example"))
//            .border(ImagePaint(image: Image("Example"),sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.2), width: 50)
        
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"),sourceRect: CGRect(x: 0, y: 0.4, width: 1, height: 0.5), scale: 0.3), lineWidth: 20)
            .frame(width: 300, height: 200)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

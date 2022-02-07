//
//  ContentView.swift
//  Moonshot
//
//  Created by Yi An Chen on 2022/2/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Image("Example")
//            .frame(width: 300, height: 300)
//            .clipped()
        
        //Scaled To Fit
//        Image("Example")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 300, height: 300)
        
        //Scaled To Fill
        GeometryReader { geo in
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

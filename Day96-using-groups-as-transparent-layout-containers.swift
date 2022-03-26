//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Yi An Chen on 2022/3/26.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group { // group contains no layout information
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna nad Arya")
        }
        .font(.title)
    }
}

// compact, regular screen size
struct ContentView: View {
//    @State private var layoutVertically = false
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
//        Group {
//            if layoutVertically {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//        .onTapGesture {
//            layoutVertically.toggle()
//        }
        
        Group {
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

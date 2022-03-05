//
//  ContentView.swift
//  FriendFace
//
//  Created by Yi An Chen on 2022/3/5.
//

import SwiftUI

extension View {
    func erasedToAnyView() -> AnyView {
        AnyView(self)
    }
}

struct ContentView: View {
//    var randomText: some View {
//        if Bool.random() {
//            return Text("Hello, world!")
//                .frame(width: 300)
//        } else {
//            return Text("Hello, world!")
//        }
//    } //error
    
    var randomText2: some View {
        if Bool.random() {
            return AnyView(Text("Hello, world!")
                            .frame(width: 300))
        } else {
            return AnyView(Text("Hello, world!"))
        }
    } // type erasure
    
    @ViewBuilder var randomText3: some View {
        if Bool.random() {
            Text("Hello, world!")
                .frame(width: 300)
        } else {
            Text("Hello, world!")
        }
    } // @ViewBuilder
    
    var randomText4: some View {
        Group {
            if Bool.random() {
                Text("Hello, world!")
                    .frame(width: 300)
            } else {
                Text("Hello, world!")
            }
        }
    } // Group
    
    // inert modifiers: .blur(), .opacity()
    
    var randomText: some View {
        Text("Hello, world!")
            .frame(width: Bool.random() ? 300 : nil)
    }
    
    @State private var views = [AnyView]()
    
    var body: some View {
        // randomText
        
        VStack {
            Button("Add Shape") {
                if Bool.random() {
                    views.append(AnyView(Circle().frame(height: 50)))
                } else {
                    views.append(AnyView(Rectangle().frame(width: 50)))
                }
            }
            
            ForEach(0..<views.count, id: \.self) {
                views[$0]
            }
            
            Spacer()
            
            Text("Hello, world!")
                .font(.title)
                .erasedToAnyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

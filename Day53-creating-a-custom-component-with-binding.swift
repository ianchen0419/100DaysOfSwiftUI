//
//  ContentView.swift
//  Bookworm
//
//  Created by Yi An Chen on 2022/2/20.
//

import SwiftUI

struct PushButton: View {
    let title: String
    //@State var isOn: Bool // @State is only for local state, not for external state
    @Binding var isOn: Bool // @Binding is external state
    
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom)
        )
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
//        Form {
//            Toggle("Remeber Me", isOn: $rememberMe)
//        }
        
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

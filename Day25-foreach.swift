//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yi An Chen on 2022/1/31.
//

import SwiftUI

struct ContentView: View {
    
    @State private var agents = ["Cyril", "Lana", "Pam", "Sterling"]

    var body: some View {
        
        VStack {
//            ForEach(0..<agents.count) {
//                //0..<agents.count or 0..<5 is definitly be unique
//                Text(agents[$0])
//            }
            
            ForEach(agents, id: \.self) {
                Text($0)
            }
            
            Button("Add agents") {
                agents.append("New one")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

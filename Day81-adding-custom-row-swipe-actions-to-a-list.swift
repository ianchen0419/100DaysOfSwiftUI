//
//  ContentView.swift
//  HotProspects
//
//  Created by Yi An Chen on 2022/3/18.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        List {
            Text("Taylor Swift")
//                .swipeActions {
//                    Button {
//                        print("Hi")
//                    } label: {
//                        Label("Send message", systemImage: "message")
//                    }
//                }
                .swipeActions {
                    Button(role: .destructive) {
                        print("Deleting")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

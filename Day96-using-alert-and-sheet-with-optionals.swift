//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Yi An Chen on 2022/3/26.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                selectedUser = User()
                isShowingUser = true
            }
            .alert("Welcome", isPresented: $isShowingUser) { }
//            .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//                Text(user.id)
//                Button(user.id) { }
//            }
//            .sheet(item: $selectedUser) { user in
//                Text(user.id)
//            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

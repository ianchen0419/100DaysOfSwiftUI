//
//  ContentView.swift
//  BucketList
//
//  Created by Yi An Chen on 2022/3/10.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let values = [1, 5, 3, 6, 2, 9].sorted()
//    let users = [
//        User(firstName: "Arnold", lastName: "Rimmer"),
//        User(firstName: "Kristine", lastName: "Kochanski"),
//        User(firstName: "David", lastName: "List")
//    ].sorted {
//        $0.lastName < $1.lastName
//    }
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "List")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName), \(user.lastName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

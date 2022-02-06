//
//  ContentView.swift
//  iExpense
//
//  Created by Yi An Chen on 2022/2/5.
//

import SwiftUI

//Codable: convert them into plain text and back again
struct User: Codable { //archive custom type and them put it into UserDefaults, and then unarchive it
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            //Data type is supported by UserDefaults
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Yi An Chen on 2022/2/19.
//

import SwiftUI

//Codable protocol has no effection on @Published

class User: ObservableObject, Codable {
    //SwiftUI has no rule about: if the published object contains a codable data, then the published thing itself is also codable
    enum CodingKeys: CodingKey {
        case name
        //Here are the keys you want to code, to archive and unarchive
    }
    
    @Published var name = "Paul Hudson"
    
    //anyone who subclasses our User class with custom implementation (init), they must override initialize it with custom data, to make sure they add their own values
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        //decode: Decode json/xml to User tyle
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

//final class User2: ObservableObject, Codable {
//    enum CodingKeys: CodingKey {
//        case name
//    }
//
//    @Published var name = "Paul Hudson"
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: .name)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//    }
//}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

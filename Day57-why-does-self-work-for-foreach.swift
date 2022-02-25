//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Yi An Chen on 2022/2/23.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

//Object ID: identifier that's unique to that object
struct ContentView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    var body: some View {
//        List {
//            ForEach([2, 4, 6, 8, 10], id: \.self) {
//                Text("\($0) is even")
//            }
//        }
        
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

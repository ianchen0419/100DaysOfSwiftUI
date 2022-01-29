//
//  ContentView.swift
//  WeSplit
//
//  Created by Yi An Chen on 2022/1/29.
//

import SwiftUI

struct ContentView: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        
        Form {
            NavigationView {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
//                ForEach(0..<100) { number in
//                    Text("Row \(number)")
//                }
//                ForEach(0..<100) {
//                    Text("Row \($0)")
//                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

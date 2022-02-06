//
//  ContentView.swift
//  iExpense
//
//  Created by Yi An Chen on 2022/2/5.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
//        VStack {
//            List {
//                ForEach(numbers, id: \.self) {
//                    Text("Row \($0)")
//                } //onDelete modifier only exist on ForEach
//                .onDelete(perform: removeRows)
//            }
//
//            Button("Add Number") {
//                numbers.append(currentNumber)
//                currentNumber += 1
//            }
//        }
        
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    } //onDelete modifier only exist on ForEach
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
        }
    }
    
    //IndexSet: sorted int set, telling us the positions of all the items in ForEach that should be removed
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

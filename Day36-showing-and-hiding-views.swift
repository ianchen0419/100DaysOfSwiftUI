//
//  ContentView.swift
//  iExpense
//
//  Created by Yi An Chen on 2022/2/5.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    //@Environment will store data externally
    
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello, \(name)")
            
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

struct ContentView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            //show the sheet
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Swift")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

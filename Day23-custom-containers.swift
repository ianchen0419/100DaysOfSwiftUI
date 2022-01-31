//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yi An Chen on 2022/1/31.
//

import SwiftUI

//generics: you can pass any kind of content you want (which need to conform View protocol)
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
//    let content: (Int, Int) -> Content
    //accept 2 intergers and return some kind of content display
    @ViewBuilder let content: (Int, Int) -> Content
    //@ViewBuilder will make content become tuple views
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                //if id: \.self is removed, when columns/rows changes, the change will never reflect to view
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        
        GridStack(rows: 4, columns: 4) { row, col in
            
//            HStack {
//                Image(systemName: "\(row * 4 + col).circle")
//                Text("R\(row) C\(col)")
//                    .font(.footnote)
//            }
            
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
                .font(.footnote)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

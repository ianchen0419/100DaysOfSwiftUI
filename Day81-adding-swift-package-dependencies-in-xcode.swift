//
//  ContentView.swift
//  HotProspects
//
//  Created by Yi An Chen on 2022/3/18.
//

import SamplePackage
import SwiftUI

struct ContentView: View {
    let possibileNumbers = Array(1...60)
    
    var body: some View {
        Text(results)
    }
    
    var results: String {
        let selected = possibileNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

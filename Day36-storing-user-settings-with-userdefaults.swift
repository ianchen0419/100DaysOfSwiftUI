//
//  ContentView.swift
//  iExpense
//
//  Created by Yi An Chen on 2022/2/5.
//

import SwiftUI

struct ContentView: View {
    
//    //UserDefaults: up to 0.5 MB or 512 KB
//    //@AppStorage
//
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//    //We can't assign the initial value
//    //iOS will wait few seconds to write UserDefaults, if we change the value and the app die quickly, the value won't be saved
//
//    var body: some View {
//        Button("Tap count: \(tapCount)") {
//            tapCount += 1
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
//        }
//
//    }
    
    //@AppStorage will work like just UserDefaults
    @AppStorage("tapCount") private var tapCount = 0 //can't store struct
//    @AppStorage("Tap") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

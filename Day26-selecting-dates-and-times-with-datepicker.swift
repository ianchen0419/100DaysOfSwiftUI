//
//  ContentView.swift
//  BetterRest
//
//  Created by Yi An Chen on 2022/2/2.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date.now
    
    var body: some View {
        Form {
//            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                .labelsHidden() //if yoou want label gone, use .labesHidden(), so that Voiceover can read this
            
            DatePicker("Please enter a time", selection: $wakeUp, in: Date.now...)
                .labelsHidden() //if yoou want label gone, use .labesHidden(), so that Voiceover can read this
        }
        
    }
    
//    func exampleDate() {
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = Date.now...tomorrow
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

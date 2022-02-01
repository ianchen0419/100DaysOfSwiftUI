//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Yi An Chen on 2022/1/31.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    @State var agreedToTorems = false
    @State var agreedToPrivacyPolicy = false
    @State var agreedToEmails = false

    var body: some View {
        
        let binding = Binding(
            get: {selection},
            set: {selection = $0}
        )
        
        let agreedToAll = Binding(
            get: {
                agreedToTorems && agreedToPrivacyPolicy && agreedToEmails
            },
            set: {
                agreedToTorems = $0
                agreedToPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )
        
        Form {
            Section {
                Picker("select a number", selection: binding) {
                    ForEach(0..<3) {
                        Text("Item \($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section {
                Toggle("Agree to terms", isOn: $agreedToTorems)
                Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
                Toggle("Agree to receive shipping emails", isOn: $agreedToEmails)
            }
            
            Section {
                Toggle("Agree to all", isOn: agreedToAll)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

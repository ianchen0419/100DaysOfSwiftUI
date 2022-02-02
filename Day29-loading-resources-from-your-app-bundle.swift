//
//  ContentView.swift
//  WordScramble
//
//  Created by Yi An Chen on 2022/2/2.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        Text("2")
    }
    
    func loadFile() {
        /**
         * Xcode will bring extra files like xml or json into main bundle
         * Use `Bundle.main.url` to access main bundle
         * If extra files exist, `Bundle.main.url` will return `URL`, otherwise well be `nil`
         */
        
        
        //sandboxing
        
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            //file will be found
            
            //if file is large and can't load, contentsOf will throw error
            if let fileContents = try? String(contentsOf: fileURL) {
                //we loaded the file into the string
                print(fileContents)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

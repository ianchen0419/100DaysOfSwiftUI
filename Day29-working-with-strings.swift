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
    
    func test() {
//        let input = "a b c"
//        let letters = input.components(separatedBy: " ")
        
        
//        let input = """
//a
//b
//c
//"""
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift"
        let checker = UITextChecker()
        
        //utf16: character encoding
        //NS: NextStep company
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        //wrap: when checked finished, will you begin again?
        
        let allGood = misspelledRange.location == NSNotFound
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

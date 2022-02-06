//
//  ContentView.swift
//  iExpense
//
//  Created by Yi An Chen on 2022/2/5.
//

import SwiftUI

//struct User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}
class User: ObservableObject { //we want other things to be able to monitor this for changes
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins" //@Published means this one is important and changed, please reload your view to reflect that change
}

/**
 * 1. StateObject
 * 2. ObservedObject
 * 3. EnvironmentObject
 *
 * @ means property wrapper
 */



struct ContentView: View {
    
//    @State private var user = User()
    //each time a value inside our struct changes, the whole struct changes
    /**
     * `@State` means ask SwiftUI to watch a propert for changes.
     *  If a property changed, `@State` will cause body property to be reinvoked with new values.
     *  When user use a `struct`, everytime he modified a property of that `struct`, the whole `struct` was changing.
     *
     *  `@State` will not watch values inside of `class` property. He will only watch `class` instance self.
     */
    
    /**
     * - If we have 2 SwiftUI views, and we send them both the same `struct`, they actually have a unique copy of that struct, if one changes it, the other view will not see those changes
     * - One the other hand, if we use `class` instances and give that to both views, they will share changes
     *
     * - If SwiftUI developers need serval views share same chage, they should use `class` rather than `struct`
     */
    
    @StateObject var user = User()
    //@StateObject means We are making a new class instance that should be watched for any change annoucement
    
    var body: some View {
        Form {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

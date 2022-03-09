//
//  ContentView.swift
//  Instafilter
//
//  Created by Yi An Chen on 2022/3/9.
//

/**
 * 1. UIKit has a class called UIView, which is a parent class for all the views and its layouts
 * 2. UIKit has a class called UIViewController, which is designed to hold all the code to bring UIView to life
 * 3. UIKit relies very heavily on delegation (design pattern) to decide where work happens
 */
import SwiftUI


struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        
        Button("Select Image") {
            showingImagePicker = true
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Instafilter
//
//  Created by Yi An Chen on 2022/3/9.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

//UIImage, comes from UIKit
//CGImage, comes from CGGraphic
//CIImage, comes from CoreImage: Stored all information required to produce an image

struct ContentView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
//        image = Image("Example")
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
//        let currentFilter = CIFilter.sepiaTone()
//        let currentFilter = CIFilter.pixellate()
//        let currentFilter = CIFilter.crystallize()
//        let currentFilter = CIFilter.twirlDistortion()
        
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
//        currentFilter.intensity = 1 //sepiaTone
//        currentFilter.scale = 100 //pixellate
//        currentFilter.radius = 100 //ctystallize
//        currentFilter.radius = 1000 //twirlDistortion
//        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2) //twirlDistortion
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Instafilter
//
//  Created by Yi An Chen on 2022/3/9.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI


struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 50.0
    @State private var filterScale = 5.0
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(image == nil ? Color.secondary : Color.clear)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                    
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity) { _ in applyProccessing() }
                }
                .padding()
                
                HStack {
                    Text("Radius")
                    Slider(value: $filterRadius, in: 1...200)
                        .onChange(of: filterRadius) { _ in applyProccessing() }
                }
                .padding()
                
                HStack {
                    Text("Scale")
                    Slider(value: $filterScale, in: 1...10)
                        .onChange(of: filterScale) { _ in applyProccessing() }
                }
                .padding()
                
                HStack {
                    Button("Change Filter") {
                        showingFilterSheet = true
                    }
                    
                    Spacer()
                    
                    Button("Save", action: save)
                        .disabled(image == nil)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Group {
                    Button("Crystallize") { setFilter(CIFilter.crystallize()) } // radius
                    Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) } // radius
                    Button("Pointillize") { setFilter(CIFilter.pointillize()) }  // radius
                }
                
                Group {
                    Button("Pixellate") { setFilter(CIFilter.pixellate()) } // scale
                }
                
                Group {
                    Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) } // intensity
                    Button("Edges") { setFilter(CIFilter.edges()) } // intensity
                }
                
                Group {
                    Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) } // intensity, radius
                    Button("Vignette") { setFilter(CIFilter.vignette()) } // intensity, radius
                }
                
                // new things
                Group {
                    Button("Comic Effect") { setFilter(CIFilter.comicEffect()) } // none
                    Button("Line Overlay") { setFilter(CIFilter.lineOverlay()) } // none
                }
                
//                Button("Monochrome") { setFilter(CIFilter.colorMonochrome()) } // intensity
//                Button("Depth of Field") { setFilter(CIFilter.depthOfField()) } // radius
//                Button("Spot Light") { setFilter(CIFilter.spotLight()) }  // none
                
                Button("Cancel", role: .cancel) { }
            }
        }
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProccessing()
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            print("Success!")
        }
        
        imageSaver.errorHandler = {
            print("Oops! \($0.localizedDescription)")
        }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func applyProccessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale, forKey: kCIInputScaleKey) }
        
        guard let outputImage = currentFilter.outputImage else { return }
                
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

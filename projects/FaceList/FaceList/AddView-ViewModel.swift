//
//  AddView-ViewModel.swift
//  FaceList
//
//  Created by Yi An Chen on 2022/3/18.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import CoreLocation
import Foundation
import SwiftUI

extension AddView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var showingPickerSheet = false
        @Published var showingFailedToDetectFaceAlert = false
        @Published var detectorAccuracy = CIDetectorAccuracyLow
        @Published var inputImage: UIImage?
        @Published var inputLocation: CLLocationCoordinate2D?
        @Published var fullsize: Image?
        @Published var fullsizeUIImage: UIImage?
        @Published var thumbnail: Image?
        @Published var thumbnailUIImage: UIImage?
        @Published var name = ""
        @Published var phone = ""
        @Published var description = ""
        
        let context = CIContext()
        let locationFetcher = LocationFetcher()
        
        func makeNewFace() -> Face? {
            guard let fullsizeData = self.fullsizeUIImage?.jpegData(compressionQuality: 0.8) else { return nil }
            guard let thumbnailData = self.thumbnailUIImage?.jpegData(compressionQuality: 0.8) else { return nil }
            let name = self.name
            let phone = self.phone
            let description = self.description
            
            var latitude: CLLocationDegrees?
            var longtitude: CLLocationDegrees?
            
            if inputLocation == nil {
                locationFetcher.start()
                guard let location = self.locationFetcher.lastKnownLocation else { return nil }
                latitude = location.latitude
                longtitude = location.longitude
            } else {
                latitude = inputLocation?.latitude
                longtitude = inputLocation?.longitude
                
            }
            
            let newFace = Face(id: UUID(), name: name, phone: phone, description: description, fullsizeData: fullsizeData, thumbnailData: thumbnailData, latitude: latitude, longtitude: longtitude)
            return newFace
            
        }
        
        func loadImage() {
            guard let inputImage = self.inputImage else { return }
            
            guard let ciImage = CIImage(image: inputImage) else { return }
            let accuracy = [CIDetectorAccuracy: self.detectorAccuracy]
            let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
            let faces = faceDetector?.features(in: ciImage)
            
            if let firstFace = faces?.first {
                
                // thumbnail
                let cropBounds = firstFace.bounds
                
                if let cgImage = context.createCGImage(ciImage, from: cropBounds) {
                    thumbnailUIImage = UIImage(cgImage: cgImage)
                    thumbnail = Image(uiImage: thumbnailUIImage!)
                }
                
                // fullImage
                let filter = CIFilter.vignetteEffect()
                filter.inputImage = ciImage
                filter.center = CGPoint(x: cropBounds.midX, y: cropBounds.midY)
                filter.radius = Float(cropBounds.size.width)
                filter.falloff = 0
                filter.intensity = 0.2
                
                if let filteredImage = filter.outputImage {
                    if let cgImage = context.createCGImage(filteredImage, from: filteredImage.extent) {
                        fullsizeUIImage = UIImage(cgImage: cgImage)
                        fullsize = Image(uiImage: fullsizeUIImage!)
                    }
                }
            } else {
                showingFailedToDetectFaceAlert = true
            }
        }
    }
    
}

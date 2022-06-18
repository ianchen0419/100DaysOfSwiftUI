//
//  Face.swift
//  FaceList
//
//  Created by Yi An Chen on 2022/3/16.
//

import UIKit
import Foundation
import CoreLocation

struct Face: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var phone: String
    var description: String
    let fullsizeData: Data
    let thumbnailData: Data
    let latitude: Double?
    let longtitude: Double?
    
    var coordinate: CLLocationCoordinate2D? {
        guard let latitude = latitude else { return nil }
        guard let longtitude = longtitude else { return nil }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
    }
    
    var fullsize: UIImage {
        guard let uiImage = UIImage(data: fullsizeData) else { return UIImage() }
        return uiImage
    }
    
    var thumbnail: UIImage {
        guard let uiImage = UIImage(data: thumbnailData) else { return UIImage() }
        return uiImage
    }
    
    // Example
    static var thumbnailSample: Data {
        guard let uiImage = UIImage(named: "shirotan-thumbnail") else { return Data() }
        guard let data = uiImage.jpegData(compressionQuality: 0.8) else { return Data() }
        return data
    }
    
    static var fullsizeSample: Data {
        guard let uiImage = UIImage(named: "shirotan") else { return Data() }
        guard let data = uiImage.jpegData(compressionQuality: 0.8) else { return Data() }
        return data
    }
    
    static let example = Face(id: UUID(), name: "Shirotan", phone: "09111222333", description: "Best harp seal", fullsizeData: thumbnailSample, thumbnailData: thumbnailSample, latitude: 51.501, longtitude: -0.141)
}

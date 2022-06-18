//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Yi An Chen on 2022/3/13.
//

import Foundation
import MapKit
import LocalAuthentication

extension LAError: Identifiable {
    public var id: Int {
        self.errorCode
    }
}

extension ContentView {
    // responsible to running all UI updated, we want all the class in this code anytime it runs anything at all
    // UI updates must happen on the main actor
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set) var locations: [Location]
        @Published var selectedPlace: Location?
        @Published var isUnlocked = false
        @Published var authError: LAError?
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegin.center.latitude, longtitude: mapRegin.center.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace = selectedPlace else { return }
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenicationError in
                    Task { @MainActor in //always be on main actor
                        if success {
    //                        Task { // start a background task, and immediately use it
    //                            await MainActor.run { // to jump across the main actor
    //                                self.isUnlocked = true // to cue up some work to make is unlocked true
    //                            }
    //                        }
                            
                            
                            self.isUnlocked = true
                            
                        } else {
                            if let error = authenicationError {
                                self.authError = LAError(_nsError: error as NSError)
                            }
                            
                        }
                    }
                }
            } else {
                // no biometrics
            }
        }
    }

}

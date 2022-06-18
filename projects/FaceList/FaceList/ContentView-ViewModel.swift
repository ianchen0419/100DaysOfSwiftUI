//
//  ContentView-ViewModel.swift
//  FaceList
//
//  Created by Yi An Chen on 2022/3/17.
//

import Foundation
import LocalAuthentication

extension LAError: Identifiable {
    public var id: Int {
        self.errorCode
    }
}

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var showingAddSheet = false
        @Published var faces = [Face]()
        @Published var isUnlocked = false
        @Published var authError: LAError?
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedFaces")
        
        func delete(_ face: Face) {
            if let index = self.faces.firstIndex(of: face) {
                self.faces.remove(at: index)
                save()
            }
        }
        
        func update(newFace: Face, oldFace: Face) {
            if let index = self.faces.firstIndex(of: oldFace) {
                self.faces[index] = newFace
                save()
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(self.faces)
                try data.write(to: self.savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock this app."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    Task { @MainActor in
                        if success {
                            self.isUnlocked = true
                        } else {
                            if let error = authenticationError {
                                self.authError = LAError(_nsError: error as NSError)
                            }
                        }
                    }
                }
            } else {
                // no biometric
            }
        }
        
        init() {
            do {
                let data = try Data(contentsOf: self.savePath)
                faces = try JSONDecoder().decode([Face].self, from: data)
            } catch {
                self.faces = []
            }
        }
    }
}

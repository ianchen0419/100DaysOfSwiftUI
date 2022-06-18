//
//  DetailView.swift
//  FaceList
//
//  Created by Yi An Chen on 2022/3/16.
//

import MapKit
import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String
    @State private var phone: String
    @State private var description: String
    @State private var showDeleteAlert = false
    @State private var mapRegion: MKCoordinateRegion
    
    var face: Face
    var onSave: (Face) -> Void
    var onDelete: (Face) -> Void
    
    var body: some View {
        List {
            Section {
                Image(uiImage: face.fullsize)
                    .resizable()
                    .scaledToFit()
            }
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Section {
                NavigationLink {
                    EditView(fieldName: "Name", fieldValue: name) { updatedValue in
                        name = updatedValue
                    }
                } label: {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(name)
                            .foregroundColor(.gray)
                    }
                }
                
                NavigationLink {
                    EditView(fieldName: "Phone", fieldValue: phone, keyboardType: .numberPad) { updatedValue in
                        phone = updatedValue
                    }
                } label: {
                    HStack {
                        Text("Phone")
                        Spacer()
                        Text(phone)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            if face.description.isEmpty == false {
                Section("Description") {
                    NavigationLink {
                        EditView(fieldName: "Description", fieldValue: description) { updatedValue in
                            description = updatedValue
                        }
                    } label: {
                        Text(description)
                    }
                }
            }
            
            if face.coordinate != nil {
                Section {
                    Map(coordinateRegion: $mapRegion, annotationItems: [face]) { face in
                        MapMarker(coordinate: face.coordinate!)
                    }
                        .frame(minHeight: 120)
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            
            
            Section {
                Button("Delete") {
                    showDeleteAlert = true
                }
                
            }
            .foregroundColor(.red)
        }
        .navigationTitle(face.name)
        .alert("Delete This Person?", isPresented: $showDeleteAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) {
                onDelete(face)
                dismiss()
            }
        } message: {
            Text("Do you want to delete \(face.name)?")
        }
        .onDisappear {
            if face.name != name || face.phone != phone || face.description != description {
                var newFace = face
                newFace.name = name
                newFace.phone = phone
                newFace.description = description
                onSave(newFace)
            }
            
        }
    }
    
    
    init(face: Face, onSave: @escaping (Face) -> Void, onDelete: @escaping (Face) -> Void) {
        self.face = face
        self.onSave = onSave
        self.onDelete = onDelete
        _name = State(initialValue: face.name)
        _phone = State(initialValue: face.phone)
        _description = State(initialValue: face.description)
        _mapRegion = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: face.latitude ?? 0, longitude: face.longtitude ?? 0), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(face: Face.example) { _ in } onDelete: { _ in }
        }
    }
}

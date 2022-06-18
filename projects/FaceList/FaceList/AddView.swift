//
//  AddView.swift
//  FaceList
//
//  Created by Yi An Chen on 2022/3/15.
//

import SwiftUI

struct AddView: View {
    private enum Field: Hashable {
        case name, phone, description
    }
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ViewModel()
    @FocusState private var focusedField: Field?
    
    var onSaveImage: (Face) -> Void

    var body: some View {
        
        NavigationView {
            List {
                if viewModel.fullsize != nil && viewModel.thumbnail != nil {
                    Section {
                        viewModel.fullsize?
                            .resizable()
                            .scaledToFit()
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    Section {
                        HStack {
                            viewModel.thumbnail?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.trailing, 6)
                            
                            VStack(alignment: .leading) {
                                TextField("Name", text: $viewModel.name, prompt: Text("Name"))
                                    .focused($focusedField, equals: .name)
                                Divider()
                                TextField("Phone", text: $viewModel.phone, prompt: Text("Phone Number"))
                                    .focused($focusedField, equals: .phone)
                                    .keyboardType(.numberPad)
                            }
                        }
                    }
                    
                    Section("Description") {
                        TextEditor(text: $viewModel.description)
                            .focused($focusedField, equals: .description)
                    }
                }
                
                Section {
                    Button("Select Image") {
                        viewModel.showingPickerSheet = true
                    }
                }
                
            }
            .navigationTitle("Add People")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        if let newFace = viewModel.makeNewFace() {
                            onSaveImage(newFace)
                            dismiss()
                        }
                    }
                    .disabled(viewModel.name.isEmpty)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("Done") { focusedField = nil }
                    }
                }
                
            }
            .sheet(isPresented: $viewModel.showingPickerSheet) {
                ImagePicker(inputImage: $viewModel.inputImage, inputLocation: $viewModel.inputLocation)
            }
            .alert("Failed to Detect Face", isPresented: $viewModel.showingFailedToDetectFaceAlert) {
                Button("OK") { }
                if viewModel.detectorAccuracy == CIDetectorAccuracyLow {
                    Button("Try Higher Detector") {
                        viewModel.detectorAccuracy = CIDetectorAccuracyHigh
                        viewModel.loadImage()
                    }
                }
            } message: {
                Text("We can't detect face in this image, please try again or change another image.")
            }
            .onChange(of: viewModel.inputImage) { _ in viewModel.loadImage() }
        }
    }
    
    init(onSaveImage: @escaping (Face) -> Void) {
        self.onSaveImage = onSaveImage
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AddView() { _ in }
        }
    }
}

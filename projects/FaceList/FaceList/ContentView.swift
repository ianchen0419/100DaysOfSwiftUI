//
//  ContentView.swift
//  FaceList
//
//  Created by Yi An Chen on 2022/3/15.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isUnlocked {
            NavigationView {
                List(viewModel.faces) { face in
                    NavigationLink {
                        DetailView(face: face) { newFace in
                            viewModel.update(newFace: newFace, oldFace: face)
                        } onDelete: { face in
                            viewModel.delete(face)
                        }
                    } label: {
                        HStack {
                            Image(uiImage: face.thumbnail)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                                .padding(.trailing, 6)
                            
                            Text(face.name)
                        }
                    }
                }
                .navigationTitle("Face List")
                .sheet(isPresented: $viewModel.showingAddSheet) {
                    AddView() { newFace in
                        viewModel.faces.append(newFace)
                        viewModel.save()
                    }
                }
                .toolbar {
                    Button {
                        viewModel.showingAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
            }
        } else {
            Button("Unlock App") {
                viewModel.authenticate()
            }
            .buttonStyle(.borderedProminent)
            .alert(item: $viewModel.authError) { error in
                Alert(title: Text("Authenication Error"), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

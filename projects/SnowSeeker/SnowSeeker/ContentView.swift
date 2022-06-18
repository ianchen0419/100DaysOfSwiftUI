//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Yi An Chen on 2022/3/26.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack) // need @ViewBuilder because 1 of our return value has modifier
        } else {
            self
        }
    }
}

struct ContentView: View {
    private enum SortingCase {
        case alphabetical, country, normal
    }
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    @State private var showingSorting = false
    @State private var sortingStatus = SortingCase.normal
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .imageScale(.large)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Button {
                    showingSorting = true
                } label: {
                    Image(systemName: "arrow.up.arrow.down.circle")
                        .symbolRenderingMode(.hierarchical)
                }
            }
            .confirmationDialog("Sorting Method", isPresented: $showingSorting) {
                Button("Alphabetical order") { sortingStatus = .alphabetical }
                Button("Country order") { sortingStatus = .country }
                Button("Default order") { sortingStatus = .normal }
            }
            
            WelcomeView()
        }
        .environmentObject(favorites)
//        .phoneOnlyNavigationView()
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return sortedResort
        } else {
            return sortedResort.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var sortedResort: [Resort] {
        switch sortingStatus {
        case .alphabetical:
            return resorts.sorted { $0.name < $1.name }
        case .country:
            return resorts.sorted { $0.country < $1.country }
        case .normal:
            return resorts
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

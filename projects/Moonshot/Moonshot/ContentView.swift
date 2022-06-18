//
//  ContentView.swift
//  Moonshot
//
//  Created by Yi An Chen on 2022/2/7.
//

import SwiftUI

struct ContentView: View {
    
    //if we use generic, we also need type annotation here
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    
    var toolbarIcon: String {
        if showingGrid {
            return "list.bullet"
        } else {
            return "square.grid.2x2"
        }
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        NavigationView {
            Group {
                if showingGrid {
                    GridLayoutView(missions: missions, astronauts: astronauts)
                } else {
                    ListLayoutView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    Image(systemName: toolbarIcon)
                        .accessibilityElement()
                }
                .accessibilityLabel("Toggle to \(showingGrid ? "list" : "grid" ) layout")
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}

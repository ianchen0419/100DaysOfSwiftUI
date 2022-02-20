//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Yi An Chen on 2022/2/19.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
        
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
//           Color.red
//            ProgressView()
//        }
//        .frame(width: 200, height: 200)
        
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                //success
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                //failure error
                Text("There was an error loading the image.")
            } else {
                //still in progress
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

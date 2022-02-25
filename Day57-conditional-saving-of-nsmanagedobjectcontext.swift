//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Yi An Chen on 2022/2/23.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

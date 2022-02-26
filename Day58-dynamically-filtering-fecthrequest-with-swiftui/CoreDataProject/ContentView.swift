//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Yi An Chen on 2022/2/23.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstname = "Taylor"
                taylor.lastname = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstname = "Ed"
                ed.lastname = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstname = "Adele"
                adele.lastname = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

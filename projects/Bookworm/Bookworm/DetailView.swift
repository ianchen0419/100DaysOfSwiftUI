//
//  DetailView.swift
//  Bookworm
//
//  Created by Yi An Chen on 2022/2/21.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    var genreImage: String {
        if book.genre == "" {
            return "Default"
        } else {
            return book.genre ?? ""
        }
    }
    
    var genreText: String {
        if book.genre == "" {
            return "No genre"
        } else {
            return book.genre?.uppercased() ?? ""
        }
    }
    
    var dateText: String {
        guard let date = book.date else { return "" }
        return date.formatted(date: .long, time: .omitted)
    }
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(genreImage)
                    .resizable()
                    .scaledToFit()
                
                Text(genreText)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
            Text(dateText)
                .padding()
            
            
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete book?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        
        try? moc.save()
        dismiss()
    }
}

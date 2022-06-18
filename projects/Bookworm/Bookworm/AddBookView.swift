//
//  AddBookView.swift
//  Bookworm
//
//  Created by Yi An Chen on 2022/2/21.
//

import SwiftUI

struct AddBookView: View {
    private enum Field: Hashable {
        case title, author, review
    }
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    @FocusState private var focusedField: Field?
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Triller"]
    
    var hasInvalidBookInfo: Bool {
        title.isEmpty || author.isEmpty || review.isEmpty
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                        .focused($focusedField, equals: .title)
                    TextField("Author's name", text: $author)
                        .focused($focusedField, equals: .author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                        .focused($focusedField, equals: .review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        newBook.date = Date.now
                        
                        try? moc.save()
                        dismiss()
                    }
                }
                .disabled(hasInvalidBookInfo)
            }
            .navigationTitle("Add Book")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        focusedField = nil
                    }
                }
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AddBookView()
        }
    }
}

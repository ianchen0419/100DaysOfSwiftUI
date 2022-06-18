//
//  EditCards.swift
//  Flashzilla
//
//  Created by Yi An Chen on 2022/3/22.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    
    let savedPath = FileManager.documentsDirectory.appendingPathComponent("Cards")
    
    var body: some View {
        NavigationView {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }
                
                Section {
                    ForEach(cards) { card in
                        VStack(alignment: .leading) {
                            Text(card.prompt)
                                .font(.headline)
                            
                            Text(card.answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationBarTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear {
                cards = Card.load()
            }
        }
    }
    
    func done() {
        dismiss()
    }
    
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(id: UUID(), prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        Card.save(cards)
        
        newPrompt = ""
        newAnswer = ""
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        Card.save(cards)
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}

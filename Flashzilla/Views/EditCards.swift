//
//  EditView.swift
//  Flashzilla
//
//  Created by Michael & Diana Pascucci on 6/2/22.
//

import SwiftUI

struct EditCards: View {
    
    // MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    // Removed for Challenge 17-4 and 17-5
    // @State private var cards = [Card]()
    // Added for Challenge 17-4 and 17-5
    @State private var cards = DataManager.load()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            
                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            // Removed for Challenge 17-4 and 17-5
            // .onAppear(perform: loadData)
        }
    }
    
    // MARK: - METHODS
    func done() {
        dismiss()
    }
    
    // Removed for Challenge 17-4 and 17-5
    // func loadData() {
    //     if let data = UserDefaults.standard.data(forKey: "Cards") {
    //         if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
    //             cards = decoded
    //         }
    //     }
    // }
    
    // func saveData() {
    //     if let data = try? JSONEncoder().encode(cards) {
    //         UserDefaults.standard.set(data, forKey: "Cards")
    //     }
    // }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        // Removed for Challenge 17-4 and 17-5
        // saveData()
        // Added for Challenge 17-4 and 17-5
        DataManager.save(cards)
        // Added for Challenge 17-1
        newPrompt = ""
        newAnswer = ""
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        // Removed for Challenge 17-4 and 17-5
        // saveData()
        // Added for Challenge 17-4 and 17-5
        DataManager.save(cards)
    }
}

// MARK: - PREVIEW
struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        
        // MARK: - LIGHT MODE
        EditCards()
            .previewInterfaceOrientation(.landscapeLeft)
        
        // MARK: - DARK MODE
        EditCards()
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}

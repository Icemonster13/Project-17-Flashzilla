//
//  Card.swift
//  Flashzilla
//
//  Created by Michael & Diana Pascucci on 6/1/22.
//

import SwiftUI

// Removed for Challenge 17-3
// struct Card: Codable {
// Added for Challenge 17-3
struct Card: Codable, Identifiable, Hashable {
    
    // MARK: - PROPERTIES
    // Added id for Challenge 17-3
    var id = UUID()
    let prompt: String
    let answer: String
    
    // MARK: - STATIC EXAMPLE
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who", answer: "Jodie Whittaker")
}

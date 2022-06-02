//
//  Card.swift
//  Flashzilla
//
//  Created by Michael & Diana Pascucci on 6/1/22.
//

import SwiftUI

struct Card: Codable {
    
    // MARK: - PROPERTIES
    let prompt: String
    let answer: String
    
    // MARK: - STATIC EXAMPLE
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who", answer: "Jodie Whittaker")
}

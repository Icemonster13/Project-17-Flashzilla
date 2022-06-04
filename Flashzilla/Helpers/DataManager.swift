//
//  DataManager.swift
//  Flashzilla
//
//  Created by Michael & Diana Pascucci on 6/3/22.
//

import SwiftUI

// Struct added for Challenge 17-4 and 17-5
struct DataManager {
    
    static let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
    
    static func load() -> [Card] {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                return decoded
            }
        }
        
        return []
    }
    
    static func save(_ cards: [Card]) {
        if let encoded = try? JSONEncoder().encode(cards) {
            try? encoded.write(to: savePath, options: [.atomic, .completeFileProtection])
        }
    }
    
}

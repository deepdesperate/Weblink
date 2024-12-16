//
//  ReadingItem.swift
//  Weblink
//
//  Created by Naman Deep on 06/12/24.
//

import Foundation
import Observation

@Observable
class ReadingItem: Identifiable, Hashable, Equatable, Codable{
    
    var title: String
    var url: URL
    let creationDate: Date
    var hasFinishedReading: Bool
    let id: UUID
    
    init(title: String,
         url: URL,
         creationDate: Date = Date(),
         hasFinishedReading: Bool = false,
         id: UUID = UUID() ) {
        self.title = title
        self.url = url
        self.creationDate = creationDate
        self.hasFinishedReading = hasFinishedReading
        self.id = id
    }
    
    static func ==(lhs: ReadingItem, rhs: ReadingItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: preview helper
    
    static var example: ReadingItem {
        ReadingItem(title: "Apple", url: URL(string: "https://www.apple.com")!)
    }
    
    static var examples: [ReadingItem] {
        [.example,
         ReadingItem(title: "Google", url: URL(string: "https://www.google.com")!, hasFinishedReading: true),
         ReadingItem(title: "Facebook", url: URL(string: "https://www.facebook.com")!)
        ]
    }
    
}

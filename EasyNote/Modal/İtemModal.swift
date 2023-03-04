//
//  File.swift
//  EasyNote
//
//  Created by Erdem Özbaykuş on 2.04.2023.
//

import Foundation

struct itemModal: Identifiable, Codable {
    let id: String
    let title: String
    let isDone: Bool
    
    
    init(id: String = UUID().uuidString,title: String, isDone: Bool) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
    
    func updateCompletion() -> itemModal {
        return itemModal(id: id, title: title, isDone: !isDone)
    }
    
}

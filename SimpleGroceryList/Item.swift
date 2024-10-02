//
//  Item.swift
//  SimpleGroceryList
//
//  Created by Clint Bush on 10/1/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var id: UUID
    var title: String
    var isDone: Bool
    var createDate: Date
    var completeDate: Date?
    
    init(title: String, isDone: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isDone = isDone
        self.createDate = Date()
    }
}

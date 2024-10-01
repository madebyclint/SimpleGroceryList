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
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

//
//  GroceryList.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/27/20.
//

import Foundation

struct GroceryList: Identifiable, Codable {
    var id = UUID()
    var storeName: String
    var items: [GroceryItem]
}

extension GroceryList {
    struct Data {
        var storeName: String = ""
        var items: [GroceryItem] = []
    }

    var data: Data {
        Data(storeName: storeName, items: items)
    }
    
    mutating func update(from data: Data) {
        storeName = data.storeName
        items = data.items
    }
}

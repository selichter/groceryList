//
//  GroceryList.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/27/20.
//

import Foundation

struct GroceryList: Identifiable {
    let id = UUID()
    var storeName: String
    var items: [GroceryItem]
}

extension GroceryList {
    struct Data {
        var storeName: String = ""
        var items: [GroceryItem] = []

        var data: Data {
            Data(storeName: storeName)
        }

        mutating func update(from data: Data) {
            storeName = data.storeName
        }
    }
}

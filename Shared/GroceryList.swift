//
//  GroceryList.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/27/20.
//

import Foundation

struct GroceryList: Identifiable {
    let id = UUID()
    let storeName: String
    var items: [GroceryItem]
}

//
//  listData.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/27/20.
//

import Foundation

let cookie = GroceryItem(name: "Chocolate Chip Cookies")
let steak = GroceryItem(name: "Sirloin Steak")
let apples = GroceryItem(name: "Apples")
let kale = GroceryItem(name: "Kale")
let grapes = GroceryItem(name: "Grapes")
let bread = GroceryItem(name: "Bread")

let targetList = GroceryList(storeName: "Target", items: [cookie, apples])
let traderJoes = GroceryList(storeName: "Trader Joe's", items: [kale, bread, steak])
let aldi = GroceryList(storeName: "Aldi", items: [apples, kale, grapes])

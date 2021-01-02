//
//  GroceryListApp.swift
//  Shared
//
//  Created by Sarah Lichter on 12/22/20.
//

import SwiftUI

@main
struct GroceryListApp: App {
    @ObservedObject private var data = GroceryListData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                GroceryListsView(groceryLists: $data.groceryLists) {
                    data.save()
                }
            }
            .onAppear {
                data.load()
            }
        }
    }
}

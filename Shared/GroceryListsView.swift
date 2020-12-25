//
//  GroceryListsView.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/24/20.
//

import SwiftUI

struct GroceryListsView: View {
    let groceryLists = ["Trader Joe's", "Target", "Aldi"]
    var body: some View {
        List {
            ForEach(groceryLists, id: \.self) { groceryList in
                Text(groceryList)
                .accessibility(identifier: groceryList)
            }
        }
        .navigationTitle("Grocery Lists")

    }
}

struct GroceryListsView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListsView()
    }
}

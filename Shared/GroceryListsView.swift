//
//  GroceryListsView.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/24/20.
//

import SwiftUI

struct GroceryListsView: View {
    let groceryLists = [traderJoes, targetList, aldi]
    var body: some View {
        List {
            ForEach(groceryLists) { groceryList in
                NavigationLink(destination: ListDetailView(groceryList: groceryList)) {
                    Text(groceryList.storeName)
                        .accessibility(identifier: groceryList.storeName)
                }
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

//
// Created by Sarah Lichter on 12/25/20.
//

import SwiftUI

struct ListDetailView: View {
    let groceryItems = [GroceryItem(name: "Apples"),
                        GroceryItem(name: "Kale"),
                        GroceryItem(name: "Grapes")

    ]
    let listName: String
    var body: some View {
        List {
            ForEach(groceryItems) { item in
                Text(item.name)
            }
        }
        .navigationTitle(listName)
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(listName: "Some List Name")
    }
}

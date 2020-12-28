//
// Created by Sarah Lichter on 12/25/20.
//

import SwiftUI

struct ListDetailView: View {
    @State var groceryList: GroceryList
    @State private var isPresented = false
    @State private var newGroceryItem = GroceryItem.Data()

    var body: some View {
        List {
            ForEach(groceryList.items) { item in
                Label(item.name, systemImage: "circle")
            }
        }
        .navigationTitle(groceryList.storeName)
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $isPresented) {
            NavigationView {
                AddItemView(itemData: $newGroceryItem)
                        .navigationBarItems(leading: Button("Dismiss") {
                            isPresented = false
                        }, trailing: Button("Add") {
//                            test this
                            let newItem = GroceryItem(name: newGroceryItem.name)
                            groceryList.items.append(newItem)
                            isPresented = false
                        })
            }

        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(groceryList: aldi)
    }
}

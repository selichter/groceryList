//
//  GroceryListsView.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/24/20.
//

import SwiftUI

struct GroceryListsView: View {
    @State private var isPresented = false
    @State private var newGroceryList = GroceryList.Data()
    @State var groceryLists: [GroceryList] = []

    var body: some View {
        List {
            ForEach(groceryLists) { groceryList in
                NavigationLink(destination: ListDetailView(groceryList: groceryList)) {
                    VStack(alignment: .leading) {
                        Text(groceryList.storeName)
                            .font(.title)
                            .accessibility(identifier: groceryList.storeName)
                        Text("\(groceryList.items.count) items")
                            .font(.caption)
                            
                    }
                    
                }
            }
        }
        .navigationTitle("Grocery Lists")
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $isPresented) {
            NavigationView {
                AddGroceryListView(listData: $newGroceryList)
                        .navigationBarItems(leading: Button("Dismiss") {
                            isPresented = false
                        }, trailing: Button("Add") {
                            let newList = GroceryList(storeName: newGroceryList.storeName,
                                                      items: newGroceryList.items)

                            groceryLists.append(newList)
                            newGroceryList = GroceryList.Data()
                            isPresented = false
                        })
            }

        }

    }
}

struct GroceryListsView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListsView()
    }
}

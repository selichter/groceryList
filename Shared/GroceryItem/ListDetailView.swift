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
                HStack {
                    Image(systemName: "circle")
                    VStack(alignment: .leading) {
                        
                        Text(item.name)
                            .font(.title2)
                        HStack {
                            Text(item.storeSection.rawValue)
                            Spacer()
                            Text(item.notes)
                        }
                        .font(.caption)
                        
                        
                    }
                }
                
                
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
                            let newItem = GroceryItem(name: newGroceryItem.name,
                                                      storeSection: newGroceryItem.storeSection,
                                                      notes: newGroceryItem.notes)
                            groceryList.items.append(newItem)
                            newGroceryItem = GroceryItem.Data()
                            isPresented = false
                        })
            }   

        }
    }
}

 struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let groceryList = GroceryList(storeName: "A Store", items: [])
        ListDetailView(groceryList: groceryList)
    }
 }

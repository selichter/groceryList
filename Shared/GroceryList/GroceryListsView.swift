//
//  GroceryListsView.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/24/20.
//

import SwiftUI

struct GroceryListsView: View {
    @Binding var groceryLists: [GroceryList]
    @State private var isPresented = false
    @State private var newGroceryList = GroceryList.Data()
    
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    

    var body: some View {
        List {
            ForEach(groceryLists) { groceryList in

                NavigationLink(destination: ListDetailView(groceryList: binding(for: groceryList), saveAction: saveAction)) {
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
                            saveAction()
                            isPresented = false
                        })
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
                
            }

        }
        

    }
    
    
    private func binding(for groceryList: GroceryList) -> Binding<GroceryList> {
        guard let groceryListIndex = groceryLists.firstIndex(where: { $0.id == groceryList.id}) else {
            fatalError("Can't find grocery list in array")
        }
        return $groceryLists[groceryListIndex]
    }
    

}

struct GroceryListsView_Previews: PreviewProvider {
    static var previews: some View {
        let groceryList = GroceryList(storeName: "Test Store", items: [])
        GroceryListsView(groceryLists: .constant([groceryList]), saveAction: {})
    }
}

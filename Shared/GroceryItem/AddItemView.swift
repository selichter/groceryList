//
//  AddItemView.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/26/20.
//

import SwiftUI

struct AddItemView: View {
    @Binding var itemData: GroceryItem.Data

    var body: some View {
        List {
            Section(header: Text("New Grocery Item")
                        .accessibility(identifier: "newItemForm")
            ) {
                TextField("Item Name", text: $itemData.name)
                
                Picker("Store Section", selection: $itemData.storeSection) {
                            ForEach(StoreSection.allCases, id: \.self) { value in
                                Text(value.localizedName)
                                        .tag(value)
                            }
                }
                TextField("Amount", text: $itemData.amount)
                    .keyboardType(.decimalPad)
                TextField("Size", text: $itemData.size)

                TextField("Notes", text: $itemData.notes)
            }

        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        let emptyData = GroceryItem.Data()
        AddItemView(itemData: .constant(emptyData))
    }
}

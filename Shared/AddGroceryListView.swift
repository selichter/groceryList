//
//  AddGroceryListView.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/29/20.
//

import SwiftUI

struct AddGroceryListView: View {
    @Binding var listData: GroceryList.Data

    var body: some View {
        List {
            Section(header: Text("New Grocery List")) {
                TextField("Store Name", text: $listData.storeName)
            }
        }.listStyle(InsetGroupedListStyle())

    }
}

struct AddGroceryListView_Previews: PreviewProvider {
    static var previews: some View {
        let emptyGroceryList = GroceryList.Data()
        AddGroceryListView(listData: .constant(emptyGroceryList))
    }
}

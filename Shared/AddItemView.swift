//
//  AddItemView.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/26/20.
//

import SwiftUI

struct AddItemView: View {
//    @Binding var title: String
    @State private var title = ""

    var body: some View {
        List {
            Section(header: Text("New Grocery Item")) {
                TextField("Title", text: $title)
            }

        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}

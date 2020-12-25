//
//  GroceryListsView.swift
//  GroceryList
//
//  Created by Sarah Lichter on 12/24/20.
//

import SwiftUI

struct GroceryListsView: View {
    var body: some View {
        Text("Grocery Lists View")
            .padding()
            .accessibility(identifier: "stubViewTexts")

    }
}

struct GroceryListsView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListsView()
    }
}

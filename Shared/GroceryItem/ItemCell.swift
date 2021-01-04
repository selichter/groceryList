//
//  ItemCell.swift
//  GroceryList
//
//  Created by Sarah Lichter on 1/2/21.
//

import SwiftUI

struct ItemCell: View {
    @Binding var item: GroceryItem
    
    var body: some View {
        HStack {
            Toggle(isOn: $item.purchased, label: {
                VStack(alignment: .leading) {

                    Text(item.name)
                        .font(.title2)
                    HStack {
                        Text("\(item.amount) \(item.size)")
                        Spacer()
                        Text(item.notes)
                    }
                    .font(.caption)
                }
            })
            .padding()
            .toggleStyle(CheckboxStyle())
        }
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        let item = GroceryItem(name: "An Item", storeSection: .baking, notes: "For baking", amount: "7", size: "cups")
        ItemCell(item: .constant(item))
    }
}

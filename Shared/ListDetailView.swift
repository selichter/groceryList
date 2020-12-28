//
// Created by Sarah Lichter on 12/25/20.
//

import SwiftUI

struct ListDetailView: View {
    let groceryList: GroceryList
    var body: some View {
        List {
            ForEach(groceryList.items) { item in
                Text(item.name)
            }
        }
        .navigationTitle(groceryList.storeName)
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {

        ListDetailView(groceryList: aldi)
    }
}

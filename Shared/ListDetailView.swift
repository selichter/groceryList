//
// Created by Sarah Lichter on 12/25/20.
//

import SwiftUI

struct ListDetailView: View {
    let groceryList: GroceryList
    var body: some View {
        List {
            ForEach(groceryList.items) { item in
                Label(item.name, systemImage: "circle")
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


//struct ListDetailView: View {
//    let listName: String
//    @State private var isPresented = false
//
////    this eventually becomes binding var
//    @State private var items = ["Apples", "Kale", "Grapes"]
//
//    var body: some View {
//        List {
//            ForEach(items, id: \.self) { item in
//                Label(item, systemImage: "circle")
//            }
//        }.navigationTitle(listName)
//                .navigationBarItems(trailing: Button(action: {
//                    isPresented = true
//                }) {
//                    Image(systemName: "plus")
//                })
//                .sheet(isPresented: $isPresented) {
//                    NavigationView {
//
//                        AddItemView()
//                                .navigationBarItems(leading: Button("Dismiss") {
//                                    isPresented = false
//                                }, trailing: Button("Add") {
//                                    items.append("newItem")
//                                    isPresented = false
//                                })
//                    }
//
//                }
//    }
//}

//
// Created by Sarah Lichter on 12/25/20.
//

import SwiftUI

struct ListDetailView: View {
    let listName: String
    var body: some View {
        List {
            Text("Apples")
            Text("Kale")
            Text("Grapes")
        }.navigationTitle(listName)
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(listName: "Some List Name")
    }
}

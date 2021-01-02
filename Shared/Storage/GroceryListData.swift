//
//  GroceryListData.swift
//  GroceryList
//
//  Created by Sarah Lichter on 1/2/21.
//

import Foundation

class GroceryListData: ObservableObject {
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                           in: .userDomainMask,
                                           appropriateFor: nil,
                                           create: false)
        } catch {
            fatalError("Can't find documents directory")
        }
    }
    
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("groceryLists.data")
    }
    
    @Published var groceryLists: [GroceryList] = []
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                return
            }
            guard let groceryLists = try? JSONDecoder().decode([GroceryList].self, from: data) else {
                fatalError("Can't decode saved list data.")
            }
            DispatchQueue.main.async {
                self?.groceryLists = groceryLists
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let groceryLists = self?.groceryLists else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(groceryLists) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
}

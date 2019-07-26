//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Steven Leyva on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingItems:[ShoppingItem] = []
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    func createShoppingItem(imageData: Data, item: String) {
        let shoppingList = ShoppingItem(item: item, imageData: imageData)
        shoppingItems.append(shoppingList)
        
        saveToPersistantStore()
    }
    
    func updateShoppingItem(shoppingList: ShoppingItem, imageData: Data, item: String ) {
        guard let index = shoppingItems.index(of: shoppingList) else { return }
        shoppingItems[index].imageData = imageData
        shoppingItems[index].item = item
        
        saveToPersistantStore()
    }
    

    
    // MARK: Persistance
    
func saveToPersistantStore() {
    guard let url = shoppingListURL else { return }
    
    let encoder = PropertyListEncoder()
    do {
        let shoppingListsData = try encoder.encode(shoppingItems)
        try shoppingListsData.write(to: url)
    } catch {
        print(error)
    }
}

func loadFromPersisrantStore() {
    guard let url = shoppingListURL,
        FileManager.default.fileExists(atPath: url.path) else { return }
    
    let decoder = PropertyListDecoder()
    do {
        let data = try Data(contentsOf: url)
        let decodedShoppingLists = try decoder.decode([ShoppingItem].self, from: data)
        shoppingItems = decodedShoppingLists
    } catch {
        print(error)
    }
    
}

// MARK: - Properties

private var shoppingListURL: URL? {
    let fileManager = FileManager.default
    guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        else{ return nil }
    
    let finalURL = documentsDirectory.appendingPathComponent("items.plist")
    return finalURL
}

}

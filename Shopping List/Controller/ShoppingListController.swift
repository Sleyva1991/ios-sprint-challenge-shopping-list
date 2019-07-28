//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Steven Leyva on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListController {
    
    var shoppingItems:[ShoppingItem] = [ShoppingItem(item: "Apple" , imageName: "Apple"),
                                        ShoppingItem(item: "Grapes", imageName: "Grapes"),
                                        ShoppingItem(item: "Milk", imageName: "Milk"),
                                        ShoppingItem(item: "Popcorn", imageName: "Popcorn"),
                                        ShoppingItem(item: "Soda", imageName: "Soda"),
                                        ShoppingItem(item: "Strawberries", imageName: "Strawberries"),
                                        ShoppingItem(item: "Muffin", imageName: "Muffin")]
    
    init() {
        loadFromPersisrantStore()
    }
    
    func updateHasBeenAdded(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        shoppingItems[index].isAdded = !shoppingItems[index].isAdded
        
        saveToPersistantStore()
    }
    
    var selectedItems: Int {
        var count = 0
        for item in shoppingItems {
            if item.isAdded == true {
                count += 1
            }
        }
        return count
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

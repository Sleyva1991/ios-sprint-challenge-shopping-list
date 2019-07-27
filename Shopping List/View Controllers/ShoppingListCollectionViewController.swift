//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Steven Leyva on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let shoppingListController = ShoppingListController()

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView?.reloadData()
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "OrderSegue" {
            guard let addDetailVC = segue.destination as? ShoppingListDetailViewController,
                let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            let shoppingItem = shoppingListController.shoppingItems[indexPath.item]

            addDetailVC.shoppingListController = shoppingListController
            addDetailVC.shoppingItem = shoppingItem
        }
        }
 

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingListController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        let added = shoppingListController.addedItem.isEmpty ? nil : "Added"
        let add = shoppingListController.addItem.isEmpty ? nil : "Add"
        
        return section == 0 ? added : add
    }
    
    func shoppingItemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingListController.addedItem[indexPath.item]
        } else {
            return shoppingListController.addItem[indexPath.item]
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell () }
    
        let shoppingItem = shoppingListController.shoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
        
    
        return cell
    }
    func toggleHasBeenAdded(for cell: ShoppingListCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        let shoppingItem = shoppingItemFor(indexPath: indexPath)
        shoppingListController.updateHasBeenAdded(shoppingItem: shoppingItem)
        collectionView?.reloadData()
        }
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


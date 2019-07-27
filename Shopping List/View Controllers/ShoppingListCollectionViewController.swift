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

    func shoppingItemFor(indexPath: IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return shoppingListController.shoppingItems[indexPath.item]
        } else {
            return shoppingListController.shoppingItems[indexPath.item]
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell () }
    
        let shoppingItem = shoppingListController.shoppingItems[indexPath.item]
        cell.shoppingItem = shoppingItem
        cell.delegate = self as? ShoppingListCollectionViewCellDelegate
        
    
        return cell
    }
    func toggleHasBeenAdded(for cell: ShoppingListCollectionViewCell) {
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        let shoppingItem = shoppingItemFor(indexPath: indexPath)
        shoppingListController.updateHasBeenAdded(shoppingItem: shoppingItem)
        collectionView?.reloadItems(at: [indexPath])
        }
    }


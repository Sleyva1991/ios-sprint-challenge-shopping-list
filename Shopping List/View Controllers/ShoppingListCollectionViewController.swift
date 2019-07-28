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
    let shoppingListDetailViewController = ShoppingListDetailViewController()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "OrderSegue" {
            guard let addDetailVC = segue.destination as? ShoppingListDetailViewController else { return }
            addDetailVC.shoppingListController = shoppingListController
            
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
//        cell.delegate = self
        
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = shoppingListController.shoppingItems[indexPath.item]
        shoppingListController.updateHasBeenAdded(shoppingItem: item)
        collectionView.reloadItems(at: [indexPath])
       
    }
//
//    func toggleHasBeenAdded(for cell: ShoppingListCollectionViewCell) {
//        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
//        let shoppingItem = shoppingItemFor(indexPath: indexPath)
//        shoppingListController.updateHasBeenAdded(shoppingItem: shoppingItem)
//        collectionView?.reloadItems(at: [indexPath])
//        }
    }


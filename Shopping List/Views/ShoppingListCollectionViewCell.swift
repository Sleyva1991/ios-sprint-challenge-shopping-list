//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Steven Leyva on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ShoppingListCollectionViewCellDelegate?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var addedButton: UIButton!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
            
        }
    }
    
    func updateViews() {
        guard let shoppingItemData = shoppingItem?.imageData else { return }
        imageView.image = UIImage(data: shoppingItemData)
        shoppingLabel.text = shoppingItem?.item
        if shoppingItem?.isAdded == true {
            addedButton.setTitle("Add", for: .normal)
        } else {
            addedButton.setTitle("Added", for: .normal)
        }
    }
    
    @IBAction func addedButtonPressed(_ sender: Any) {
        delegate?.toggleHasBeenAdded(for: self)
    }
    
    
}

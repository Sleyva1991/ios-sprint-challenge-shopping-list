//
//  ShoppingItems.swift
//  Shopping List
//
//  Created by Steven Leyva on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable, Equatable {
    var item: String
    var isAdded: Bool
    var imageName: String
    
    var image: UIImage {
        return UIImage(named: imageName)!
    }
    
    init(item: String, isAdded: Bool = false, imageName: String) {
        self.isAdded  = isAdded
        self.item = item
        self.imageName = imageName
    }
}

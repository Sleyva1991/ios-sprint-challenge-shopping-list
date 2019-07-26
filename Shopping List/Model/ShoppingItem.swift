//
//  ShoppingItems.swift
//  Shopping List
//
//  Created by Steven Leyva on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable, Equatable {
    var item: String
    var isAdded: Bool
    var imageData: Data
    
    init(item: String, isAdded: Bool = false, imageData: Data) {
        self.isAdded  = isAdded
        self.item = item
        self.imageData = imageData
    }
}

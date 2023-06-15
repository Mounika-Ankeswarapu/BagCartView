//
//  Item.swift
//  BagsCart
//
//  Created by Mounika Ankeswarapu on 13/06/23.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var name: String
    var details: String
    var image: String
    var price: Float
    var quantity: Int
    var offset: CGFloat
    var isSwiped: Bool
    
}

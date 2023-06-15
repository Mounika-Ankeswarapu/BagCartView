//
//  CartViewModel.swift
//  BagsCart
//
//  Created by Mounika Ankeswarapu on 13/06/23.
//

import SwiftUI

class CartViewModel: ObservableObject {
    @Published var items = [
        Item(name: "Louis Vuitton", details: "Genuine  Women's Top-Handle Bags", image: "LV", price: 20.20, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Mochi", details: "Synthetic Shoulder Bags For Womens", image: "MC", price: 22.20, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Gucci", details: "Women Handbags Shoulder", image: "GC", price: 40.20, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Baggit", details: "Women's  Handbag - Medium", image: "BG", price: 15.20, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Lino Perros", details: "Genuine  Women's Top-Handle Bags", image: "LP", price: 10.20, quantity: 1, offset: 0, isSwiped: false)
    ]
}

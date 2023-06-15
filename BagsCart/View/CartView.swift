//
//  CartView.swift
//  BagsCart
//
//  Created by Mounika Ankeswarapu on 13/06/23.
//

import Foundation
import SwiftUI

struct CartView: View {
    @StateObject var cartData = CartViewModel()
   
    
    var body: some View {
        VStack{
            HStack(spacing: 20){
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(Color.steel)
                   
                }
                Text("My Cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.steel)
                Spacer()
             
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(cartData.items) { item in
                        ItemView(item: $cartData.items[getIndex(item: item)], items: $cartData.items)
                        
                    }
                }
                
            }
            
            // Bottom View
            
            VStack{
                HStack{
                    Text("Total Cart Price:")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer()
                    
                    // calculating total price
                    
                    Text(CalculateTotalPrice())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                }
                .padding([.top, .horizontal])
                
                Button(action: {}) {
                  Text("Check Out")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(
                            LinearGradient(gradient: .init(colors: [Color.lightGray, Color.lightGray]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15)
                    
                }

            }
            .background(Color.bgColor1)
            
        }
//        .background(Color.white.ignoresSafeArea())
        .background(Image.bagbg.resizable().ignoresSafeArea())
        
    }
    func getIndex(item: Item) -> Int{
        return cartData.items.firstIndex { (item1) -> Bool in
            return item.id == item1.id
            
        } ?? 0
    }
    
    func CalculateTotalPrice() -> String {
        var price: Float = 0
        cartData.items.forEach{ (item) in
            price += Float(item.quantity) * item.price
        }
        return getPrice(value: price)
    }
    func getPrice(value: Float) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        return format.string(from: NSNumber(value: value )) ?? ""
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

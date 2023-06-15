//
//  ItemView.swift
//  BagsCart
//
//  Created by Mounika Ankeswarapu on 13/06/23.
//

import Foundation
import SwiftUI

struct ItemView: View {
    @Binding var item: Item
    @StateObject var cartData = CartViewModel()
    @Binding var items: [Item]
    var body: some View {
        Divider()
        ZStack{
            LinearGradient(gradient: .init(colors: [Color.bgColor5, Color.lightGray]), startPoint: .leading, endPoint: .trailing)
            // Delete button
            
            HStack{
                Spacer()
                Button(action: {
                    withAnimation(.easeIn){deleteItem()}
                }) {
                  Image(systemName: "trash")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 50)
                }
            }
           
            HStack(spacing : 10){
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(15)
                    .padding()
                VStack(alignment: .leading, spacing: 5){
                    
                    Text(item.name)
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Text(item.details)
                        .fontWeight(.regular)
                        .foregroundColor(.steel)
                    
                    HStack(spacing: 15) {
                        Text(getPrice(value: item.price))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        VStack {
                            HStack{
                                Button(action: {
                                    item.quantity += 1
                                }) {
                                    Image(systemName: "plus")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.black)
                                    
                                }
                                
                                Text("\(item.quantity)")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 10 )
                                    .padding(.vertical, 5)
                                    .background(Color.black.opacity(0.06))
                                Button(action: {
                                    if item.quantity > 1 {
                                        item.quantity -= 1
                                    }
                                    
                                })
                                {
                                    Image(systemName: "minus")
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.black)
                                    
                                }
                            }
                            
                            Text(CalculatePrice())
                                .font(.body)
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            
                        }
                        
                    }
                }
                .padding()
                
            }
            
            .background(Image.bagbg.resizable())
            .contentShape(Rectangle())
            .offset(x: item.offset)
            .gesture(DragGesture().onChanged(onChange(value:)).onEnded(onEnd(value:)))
            
           
        }
        Divider()
        
        
    }
    
    func onChange(value: DragGesture.Value) {
        if value.translation.width < 0 {
            
            if item.isSwiped{
                item.offset = value.translation.width - 90
             
            }
            else{
                item.offset = value.translation.width
            }
              
        }
       
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeOut){
            
            if value.translation.width < 0 {
                // checking
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    item.offset = -1000
                    deleteItem()
                }
                else if -item.offset > 50 {
                    // updating is swiping
                    item.isSwiped = true
                    item.offset = -90
                   
                }
                else {
                    item.isSwiped = false
                    item.offset = 0
                }
            }
            else{
                item.isSwiped = false
                item.offset = 0
            }
        }
    }
    
    // removing item from the list
    
    func deleteItem(){
        items.removeAll { (item) -> Bool in
            return self.item.id == item.id
        }
    }
    
    func getPrice(value: Float) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        return format.string(from: NSNumber(value: value )) ?? ""
        
    }
    
    func CalculatePrice() -> String {
        var price: Float = 0
        price += Float(item.quantity) * item.price
        return getPrice(value: price)
    }
}




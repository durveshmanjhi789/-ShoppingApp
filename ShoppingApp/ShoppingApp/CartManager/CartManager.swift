//
//  CartManager.swift
//  ShoppingApp
//
//  Created by Durvesh Manjhi on 12/08/25.
//

import Combine

final class CartManager: ObservableObject {
    @Published private(set) var items: [CategoryItem] = []
    
    func toggle(_ item:CategoryItem){
        
        if items.contains(item){
            items.removeAll{$0 == item}
        }else{
            items.append(item)
        }
    }
    
    func contains(_ item:CategoryItem) -> Bool{
       items.contains(item)
    }
    
    func clear(){
        items.removeAll()
    }
    var totalCount:Int{
        items.count
    }
}

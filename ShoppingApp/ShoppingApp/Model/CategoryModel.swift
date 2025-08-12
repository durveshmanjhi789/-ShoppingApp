//
//  CategoryModel.swift
//  ShoppingApp
//
//  Created by Durvesh Manjhi on 12/08/25.
//

import SwiftUI

struct CategoryResponse: Codable {
    let categories: [CategoryItem]
}


struct CategoryItem:Codable,Identifiable,Hashable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    // Mock fields
    var price: Double = Double.random(in: 20...80)
    var rating: Double = Double.random(in: 3...5)
    
    var id: String { idCategory }
    
    enum CodingKeys: String, CodingKey {
           case idCategory, strCategory, strCategoryThumb, strCategoryDescription
       }
}

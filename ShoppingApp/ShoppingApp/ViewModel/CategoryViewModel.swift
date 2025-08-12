//
//  CategoryViewModel.swift
//  ShoppingApp
//
//  Created by Durvesh Manjhi on 12/08/25.
//

import Combine
@MainActor
final class CategoryViewModel:ObservableObject{
    @Published var categories:[CategoryItem] = []
    @Published var loading = false
    @Published var errorMessage : String?
    
    func loadCategories() async{
        loading = true
        errorMessage = nil
        
        do{
            categories = try await NetworkManager.shared.fetchCategories()
        }catch{
            errorMessage = error.localizedDescription
        }
        loading = false
    }
    
}

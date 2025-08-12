//
//  NetworkManager.swift
//  ShoppingApp
//
//  Created by Durvesh Manjhi on 12/08/25.
//
import SwiftUI
//import Combine

// MARK: - Singleton Service
final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchCategories() async throws -> [CategoryItem] {
        guard let url = URL(string:"https://www.themealdb.com/api/json/v1/1/categories.php") else{
            throw URLError(.badURL)
        }
        
        let (data , response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            throw URLError(.badServerResponse)
        }
        let responseData = try JSONDecoder().decode(CategoryResponse.self, from: data)
        var decoded = responseData.categories

        // Add mock price & rating
        decoded = decoded.map{ item in
            var mutableItem = item
            mutableItem.price = Double.random(in: 10...1000)
            mutableItem.rating = Double.random(in: 2...5)
            return mutableItem
        }
        return decoded
    }
    
}

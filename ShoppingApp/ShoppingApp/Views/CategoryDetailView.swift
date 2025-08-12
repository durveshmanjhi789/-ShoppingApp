//
//  CategoryDetailView.swift
//  ShoppingApp
//
//  Created by Durvesh Manjhi on 12/08/25.
//

import SwiftUI


struct CategoryDetailView: View {
    let item: CategoryItem
    @EnvironmentObject var cart: CartManager
    @Environment(\.dismiss) var dismiss
    @State private var showThankYou = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: item.strCategoryThumb)) { image in
                    image.resizable().scaledToFit()
                } placeholder: { ProgressView() }
                .frame(height: 200)
                
                Text(item.strCategory).font(.title)
                Text(item.strCategoryDescription).font(.body)
                
                HStack {
                    Text("£\(String(format: "%.2f", item.price))")
                    Spacer()
                    Label(String(format: "%.1f", item.rating), systemImage: "star.fill")
                        .foregroundColor(.yellow)
                }
                
                Button(cart.contains(item) ? "Remove from Cart" : "Add to Cart") {
                    cart.toggle(item)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button("Checkout") {
                    showThankYou = true
                    cart.clear()
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .alert("Thank You!", isPresented: $showThankYou) {
            Button("OK", role: .cancel) { dismiss() }
        } message: {
            Text("Your checkout is complete.")
        }
    }
}

//
//  CartView.swift
//  ShoppingApp
//
//  Created by Durvesh Manjhi on 12/08/25.
//

import SwiftUI


struct CartView: View {
    @EnvironmentObject var cart: CartManager
    @State private var showThankYou = false
    
    var body: some View {
        VStack {
            if cart.items.isEmpty {
                Text("Cart is empty")
                    .foregroundColor(.secondary)
            } else {
                List {
                    ForEach(cart.items) { item in
                        HStack {
                            AsyncImage(url: URL(string: item.strCategoryThumb)) { image in
                                image.resizable().scaledToFit()
                            } placeholder: { ProgressView() }
                            .frame(width: 60, height: 60)
                            
                            VStack(alignment: .leading) {
                                Text(item.strCategory)
                                Text("£\(String(format: "%.2f", item.price))").font(.caption)
                            }
                        }
                    }
                }
                
                Button("Checkout (\(cart.totalCount))") {
                    showThankYou = true
                    cart.clear()
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .padding()
               
            }
        }
        .navigationTitle("Cart")
        .alert("Thank You!", isPresented: $showThankYou) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("Order placed successfully.")
        }
    }
}

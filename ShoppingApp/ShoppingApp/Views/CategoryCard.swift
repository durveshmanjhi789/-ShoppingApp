//
//  CategoryCard.swift
//  ShoppingApp
//
//  Created by Durvesh Manjhi on 12/08/25.
//
import SwiftUI

struct CategoryCard: View {
    let item: CategoryItem
    @EnvironmentObject var cart: CartManager
    @State private var showDetail = false
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: item.strCategoryThumb)) { phase in
                switch phase {
                case .empty: ProgressView()
                case .success(let image): image.resizable().scaledToFit()
                case .failure: Image(systemName: "photo").resizable().scaledToFit()
                @unknown default: EmptyView()
                }
            }
            .frame(height: 120)
            .cornerRadius(8)
            
            Text(item.strCategory)
                .font(.headline)
                .lineLimit(1)
            
            HStack {
                Text("£\(String(format: "%.2f", item.price))")
                Spacer()
                Button {
                    cart.toggle(item)
                } label: {
                    Image(systemName: cart.contains(item) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
            }
            .font(.caption)
            
            Button("View") { showDetail.toggle() }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .sheet(isPresented: $showDetail) {
                    CategoryDetailView(item: item)
                        .environmentObject(cart)
                }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}

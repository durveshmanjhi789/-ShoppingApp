//
//  ContentView.swift
//  ShoppingApp
//
//  Created by Durvesh Manjhi on 12/08/25.
//

import SwiftUI
struct ContentView: View {
    @StateObject private var vm = CategoryViewModel()
    @StateObject private var cart = CartManager()
    
    var body: some View {
        NavigationStack {
            Group {
                if vm.loading {
                    ProgressView("Loading...")
                } else if let error = vm.errorMessage {
                    VStack {
                        Text("Error: \(error)")
                        Button("Retry") {
                            Task { await vm.loadCategories() }
                        }
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(vm.categories) { item in
                                CategoryCard(item: item)
                                    .environmentObject(cart)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Categories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CartView().environmentObject(cart)
                    } label: {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "cart")
                            if cart.totalCount > 0 {
                                Text("\(cart.totalCount)")
                                    .font(.caption2)
                                    .padding(5)
                                    .background(Color.green)
                                    .clipShape(Circle())
                                    .foregroundColor(.white)
                                    .offset(x: 8, y: -8)
                            }
                        }
                    }
                }
            }
            .task { await vm.loadCategories() }
        }
        .environmentObject(cart)
    }
}
#Preview {
    ContentView()
}

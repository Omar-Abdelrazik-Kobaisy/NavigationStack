//
//  FoodDetailView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//

import SwiftUI

struct FoodDetailView: View {
    @EnvironmentObject private var cartManager: ShoppingCartManager
    let food: Food
    var onAppear : () -> ()
    var onDisAppear: () -> ()
    var body: some View {
        List {
            Section {
                LabeledContent("Icon", value: food.name)
                LabeledContent("Name", value: food.title)
                LabeledContent("Price") {
                    Text(food.price , format: .currency(code: Locale.current.currency?.identifier ?? ""))
                }
            }
            Section {
                Button {
                    cartManager.add(food)
                } label: {
                    Label("Add to Cart", systemImage: "cart.fill")
                }

            }
            Section("Description") {
                Text(food.description)
            }
        }
        .navigationTitle("Item")
        .onAppear {
            onAppear()
        }
        .onDisappear{
            onDisAppear()
        }
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(food: foods.first!, onAppear: {
            
        },onDisAppear: {
            
        })
    }
}

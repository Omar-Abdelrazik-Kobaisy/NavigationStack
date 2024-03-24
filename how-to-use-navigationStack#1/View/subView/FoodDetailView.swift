//
//  FoodDetailView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//

import SwiftUI

struct FoodDetailView: View {
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @EnvironmentObject private var routerManager: NavigationRouter
    let food: Food
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
                    routerManager.reset()
                } label: {
                    Label("Add to Cart", systemImage: "cart.fill")
                }

            }
            Section("Description") {
                Text(food.description)
            }
        }
        .navigationTitle("Item")
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(food: foods.first!)
    }
}

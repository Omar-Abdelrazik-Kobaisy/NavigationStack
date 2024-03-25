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
            if let ingredients = food.ingredients,
               let allergies = food.allergies,
               ingredients.isEmpty == false ,
               allergies.isEmpty == false{
                Section {
                    let ingredientsCount = ingredients.count
                    let allergiesCount = allergies.count
                    NavigationLink(value: Route.ingredients(items: ingredients)) {
                        Text("x\(ingredientsCount) ingredients")
                    }
                    NavigationLink(value: Route.allergies(items: allergies)) {
                        Text("x\(allergiesCount) allergies")
                    }

                }
            }
            
            if let locations = food.locations,
               locations.isEmpty == false{
                let locationCount = locations.count
                Section {
                    NavigationLink(value: Route.location(locations: locations)) {
                        Text("x\(locationCount) locations")
                    }
//                    LabeledContent("x\(locationCount) locations", value: "")
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

//
//  DrinkDetailView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//


import SwiftUI

struct DrinkDetailView: View {
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @EnvironmentObject private var routerManager: NavigationRouter
    let drink: Drink
    
    var body: some View {
        List {
            
            Section {
                LabeledContent("Icon", value: drink.name)
                LabeledContent("Name", value: drink.title)
                LabeledContent {
                    Text(drink.price,
                         format: .currency(code: Locale.current.currency?.identifier ?? ""))
                } label: {
                    Text("Price")
                }
                LabeledContent("Fizzy?", value: drink.isFizzy ? "✅" : "❌")
            }
            if let ingredients = drink.ingredients,
               let allergies = drink.allergies,
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
            
            if let locations = drink.locations,
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
                    cartManager.add(drink)
                    routerManager.reset()
                } label: {
                    Label("Add to Cart", systemImage: "cart.fill")
                }

            }
            Section("Description") {
                Text(drink.description)
            }

        }
        .navigationTitle("Item")
    }
}

struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetailView(drink: drinks[0])
    }
}

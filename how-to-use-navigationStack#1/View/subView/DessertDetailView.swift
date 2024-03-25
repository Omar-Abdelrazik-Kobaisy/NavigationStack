//
//  DessertDetailView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//


import SwiftUI

struct DessertDetailView: View {
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @EnvironmentObject private var routerManager: NavigationRouter
    let dessert: Dessert
    
    var body: some View {
        List {
            
            Section {
                LabeledContent("Icon", value: dessert.name)
                LabeledContent("Name", value: dessert.title)
                LabeledContent {
                    Text(dessert.price,
                         format: .currency(code: Locale.current.currency?.identifier ?? ""))
                } label: {
                    Text("Price")
                }
                LabeledContent("Cold?", value: dessert.isCold ? "✅" : "❌")
            }
            
            if let ingredients = dessert.ingredients,
               let allergies = dessert.allergies,
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
            
            if let locations = dessert.locations,
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
                    cartManager.add(dessert)
                    routerManager.reset()
                } label: {
                    Label("Add to Cart", systemImage: "cart.fill")
                }

            }
            Section("Description") {
                Text(dessert.description)
            }

        }
        .navigationTitle("Item")
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView(dessert: desserts[0])
    }
}

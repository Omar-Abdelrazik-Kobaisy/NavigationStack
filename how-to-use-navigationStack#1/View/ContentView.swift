//
//  ContentView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @StateObject private var cartManager = ShoppingCartManager()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Food") {
                    MenuItemsData(menuItems: foods)
                }
                Section("Drinks") {
                    MenuItemsData(menuItems: drinks)
                }
                Section("Dessert") {
                    MenuItemsData(menuItems: desserts)
                }
            }
            .navigationTitle("Menu")
            .navigationDestination(for: Food.self) { food in
                FoodDetailView(food: food, onAppear: {
                        print("Path Count on Appear --->\(path.count)")
//                    print("Path description --->\(path.description)")
                },onDisAppear: {
                    print("Path Count onDisAppear --->\(path.count)")
//                    print("Path description --->\(path.description)")
                })
            }
            .navigationDestination(for: Drink.self) { drink in
                DrinkDetailView(drink: drink)
            }
            .navigationDestination(for: Dessert.self) { dessert in
                DessertDetailView(dessert: dessert)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    CartButton(count: cartManager.items.count, didTap: {
                        // push to cartView Screen
                    })
                }
            }
        }
        .environmentObject(cartManager)
    }
}

struct MenuItemsData<T>: View where T: MenuItem{
    let menuItems: [T]
    var body: some View{
        ForEach(menuItems) { item in
            NavigationLink(value: item) {
                MenuItemView(item: item)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

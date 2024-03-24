//
//  ContentView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var routerManager = NavigationRouter()
    @StateObject private var cartManager = ShoppingCartManager()
    var body: some View {
        NavigationStack(path: $routerManager.routes) {
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
            .navigationDestination(for: Route.self) {$0}
//            .navigationDestination(for: Drink.self) { drink in
//                DrinkDetailView(drink: drink)
//            }
//            .navigationDestination(for: Dessert.self) { dessert in
//                DessertDetailView(dessert: dessert)
//            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    CartButton(count: cartManager.items.count, didTap: {
                        // push to cartView Screen
                        routerManager.push(to: .cart)
                    })
                }
            }
        }
        .environmentObject(cartManager)
        .environmentObject(routerManager)
    }
}

struct MenuItemsData<T>: View where T: MenuItem{
    let menuItems: [T]
    var body: some View{
        ForEach(menuItems) { item in
            NavigationLink(value: Route.menuItem(item: item)) {
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

//
//  ContentView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Food") {
                    MenuItemsData(menuItems: foods)
                }
                Section("Drinks") {
                    MenuItemsData(menuItems: drinks)
                }
            }
            .navigationTitle("Menu")
            .navigationDestination(for: Food.self) { food in
                FoodDetailView(food: food)
            }
            .navigationDestination(for: Drink.self) { drink in
                DrinkDetailView(drink: drink)
            }
        }
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

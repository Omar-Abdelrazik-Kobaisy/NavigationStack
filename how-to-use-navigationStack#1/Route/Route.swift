//
//  Route.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 24/03/2024.
//

import Foundation
import SwiftUI
enum Route{
    case menuItem(item: any MenuItem)
    case cart
    case ingredients(items: [Ingredient])
    case allergies(items: [Allergie])
    case location(locations: [Location])
    case mapLocation(location: Location)
    case promo
}
extension Route: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs){
        case (.menuItem(let lhsItem) , .menuItem(let rhsItem)):
            return lhsItem.id == rhsItem.id
        case (.cart, .cart):
            return true
        case (.ingredients(let lhsItems), .ingredients(let rhsItems)):
            return lhsItems == rhsItems
        case (.allergies(let lhsItems), .allergies(let rhsItems)):
            return lhsItems == rhsItems
        case (.location(let lhsItems), .location(let rhsItems)):
            return lhsItems == rhsItems
        case (.mapLocation(let lhsItem), .mapLocation(let rhsItem)):
            return lhsItem.id == rhsItem.id
        case (.promo, .promo):
            return true
        default:
            return false
        }
    }
}
extension Route: View{
    var body: some View{
        switch self{
        case .menuItem(let item):
            switch item{
            case is Food:
                FoodDetailView(food: item as! Food)
            case is Dessert:
                DessertDetailView(dessert: item as! Dessert)
            case is Drink:
                DrinkDetailView(drink: item as! Drink)
            default:
                EmptyView()
            }
        case .cart:
            CartView()
        case .ingredients(let items):
            IngredientsDetailView(ingredients: items)
        case .allergies(let items):
            AllergiesDetailView(allergies: items)
        case .location(let items):
            LocationsDetailView(locations: items)
        case .mapLocation(let item):
            MapView(location: item)
        case .promo:
            PromoView()
        }
    }
}

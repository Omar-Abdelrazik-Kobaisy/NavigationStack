//
//  Route.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 24/03/2024.
//

import Foundation
import SwiftUI
enum Route: View, Hashable{
    case menuItem(item: any MenuItem)
    case cart
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs){
        case (.menuItem(let lhsItem) , .menuItem(let rhsItem)):
            return lhsItem.id == rhsItem.id
        case (.cart, .cart):
            return true
        default:
            return false
        }
    }
    
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
        }
    }
}

//
//  ShoppingCartManager.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//

import Foundation

struct CartItem: Identifiable, Hashable {
    let id: String
    let name: String
    let title: String
    let price: Decimal
    
    init(item: any MenuItem){
        self.id = "\(item.name)_\(item.title)"
        self.name = item.name
        self.title = item.title
        self.price = item.price
    }
}

final class ShoppingCartManager: ObservableObject{
    @Published private(set) var items: [CartItem] = []
    
    func add(_ item: any MenuItem){
        items.append(CartItem(item: item))
    }
    
    func getGroupedCart() -> [CartItem: Int] {
            var itemCounts = [CartItem: Int]() // dictionary
            for item in items {
                itemCounts[item, default: 0] += 1
            }
            return itemCounts // return dictionary (Key , Value) key: item , value: item Count
        }
    
    func getTotoal() -> Decimal{
        items.reduce(0, { $0 + $1.price })
    }
}

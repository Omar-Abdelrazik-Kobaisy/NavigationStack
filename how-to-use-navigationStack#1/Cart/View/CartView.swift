//
//  CartView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cartManager: ShoppingCartManager
    var body: some View {
        List {
            let items = cartManager.getGroupedCart()
            ForEach(items.keys.sorted(by: {$0.title < $1.title})) { item in
                let count = items[item]!
                Section {
                    LabeledContent {
                        let price = Decimal(count) * item.price
                        Text(price,format: .currency(code: Locale.current.currency?.identifier ?? ""))
                    } label: {
                        Text("x\(count) "+item.name+" "+item.title)
                    }
                }
            }
            Section {
                LabeledContent {
                    Text(cartManager.getTotoal(),format: .currency(code: Locale.current.currency?.identifier ?? ""))
                } label: {
                    Text("Total")
                }

            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        let manager = ShoppingCartManager()
        CartView()
            .environmentObject(manager)
            .onAppear {
                manager.add(foods.first!)
                manager.add(foods[1])
                manager.add(foods.first!)
            }
    }
}

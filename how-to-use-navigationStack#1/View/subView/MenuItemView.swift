//
//  MenuItemView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//

import SwiftUI

struct MenuItemView: View {
    
    let item: any MenuItem
    
    var body: some View {
        LabeledContent {
            Text(item.price, format: .currency(code: Locale.current.currency?.identifier ?? ""))
        } label: {
            Text("\(item.name) \(item.title)")
        }

    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: foods.first!)
            .previewLayout(.sizeThatFits)
    }
}

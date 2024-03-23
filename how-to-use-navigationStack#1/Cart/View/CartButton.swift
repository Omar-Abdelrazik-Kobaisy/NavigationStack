//
//  CartButton.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//

import SwiftUI

struct CartButton: View {
    let count: Int
    let didTap: () -> ()
    
    private var badge: some View{
        Text("\(count)")
            .foregroundColor(.white)
            .padding(5)
            .font(.subheadline.bold())
            .background(
                Circle()
                    .fill(.red)
            )
            .offset(x: -1, y: -3)
    }
    
    var body: some View {
        Button {
            didTap()
        } label: {
            Image(systemName: "cart.fill")
                .font(.system(size: 20))
                .padding(5)
        }
        .overlay(alignment:.topTrailing) {
            if count > 0 {
                badge
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(count: 5,didTap: {})
            .previewLayout(.sizeThatFits)
    }
}

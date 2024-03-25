//
//  NavigationRouter.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 24/03/2024.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject{
    @Published var routes = [Route]()
    
    func push(to screen: Route){
        guard !routes.contains(screen) else {return}
        routes.append(screen)
    }
    func pop(){
        if let index = routes.firstIndex(of: routes.last!){
            routes.remove(at: index)
        }
    }
    func reset() {
        routes = []
//        routes.removeLast(routes.count)
    }
}

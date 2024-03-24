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
        routes.append(screen)
    }
    
    func reset() {
        routes = []
//        routes.removeLast(routes.count)
    }
}

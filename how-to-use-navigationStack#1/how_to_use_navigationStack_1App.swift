//
//  how_to_use_navigationStack_1App.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar on 23/03/2024.
//

import SwiftUI

@main
struct how_to_use_navigationStack_1App: App {
    @StateObject private var routerManager = NavigationRouter()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(routerManager)
                .onOpenURL(perform: { url in
                    if let route = RouterFinder.find(from: url){
                        routerManager.push(to: route)
                    }
                })
        }
    }
}

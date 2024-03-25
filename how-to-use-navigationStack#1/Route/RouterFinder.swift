//
//  RouterFinder.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar AbdElrazek on 25/03/2024.
//

import Foundation

enum DeepLinkURLs: String{
    case promo
}

struct RouterFinder{
    static func find(from url: URL) -> Route?{
        guard let host = url.host else {return nil}
        switch DeepLinkURLs(rawValue: host){
        case .promo:
            return .promo
        case .none:
            return nil
        }
    }
}

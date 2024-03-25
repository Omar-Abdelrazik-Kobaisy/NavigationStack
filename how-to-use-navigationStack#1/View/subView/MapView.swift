//
//  MapView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar AbdElrazek on 25/03/2024.
//

import SwiftUI
import MapKit
struct MapView: View {
    @EnvironmentObject private var router: NavigationRouter
    let location: Location
    var body: some View {
        ZStack {
            if #available(iOS 17.0, *) {
//                Map(position:
//                        .constant(
//                            .region(
//                                .init(center:
//                                        .init(latitude: location.lat,
//                                              longitude: location.long),
//                                      span: .init(latitudeDelta: 0.001, longitudeDelta: 0.001)))),
//                    content: {
//                    Marker("", coordinate: .init(latitude: location.lat, longitude: location.long))
//                })
//                .ignoresSafeArea()
//                .toolbar(.hidden, for: .navigationBar)
            } else {
                // Fallback on earlier versions
                Map(coordinateRegion: .constant(.init(center: .init(latitude: location.lat, longitude: location.long), latitudinalMeters: 100, longitudinalMeters: 100)), annotationItems: [location]) { location in
                    MapMarker(coordinate: .init(latitude: location.lat, longitude: location.long))
                }
                .ignoresSafeArea()
                .toolbar(.hidden, for: .navigationBar)
                .overlay(alignment: .bottom) {
                    HStack {
                        Group {
                            Button("Back to Menu") {
                                // TODO: Handle Menu Navigation
                                router.reset()
                            }
                            
                            
                            Button("Back to Locations") {
                                // TODO: Handle Menu Navigation
                                router.pop()
                            }
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    }
                }
            }
        }
    }
}

struct MapView_Preview: PreviewProvider{
    static var previews: some View{
        MapView(location: foods.first!.locations!.first!)
    }
}

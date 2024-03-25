//
//  LocationDetailView.swift
//  how-to-use-navigationStack#1
//
//  Created by Omar AbdElrazek on 25/03/2024.
//

import SwiftUI

struct LocationsDetailView: View {
    
    let locations: [Location]
    
    var body: some View {
        List {
            ForEach(locations, id: \.name) { location in
                NavigationLink(value: Route.mapLocation(location: location)) {
                    Text(location.name)
                }
                
            }
        }
        .navigationTitle("Locations")
    }
}

struct LocationsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LocationsDetailView(locations: foods[0].locations!)
        }
    }
}


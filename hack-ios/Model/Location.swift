//
//  Location.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 20/07/23.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

extension Location {
    static var locations: [Location] = [
        Location(name: "Tec de Monterrey", coordinate: CLLocationCoordinate2D(latitude: 25.650000, longitude: -100.291056)),
        Location(name: "Av. Luis Elizondo", coordinate: CLLocationCoordinate2D(latitude: 25.646500, longitude: -100.292306)),
        Location(name: "Valparaíso", coordinate: CLLocationCoordinate2D(latitude: 25.645150, longitude:  -100.290056))
    ]
}

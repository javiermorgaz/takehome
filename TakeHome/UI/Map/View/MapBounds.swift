//
//  MapBounds.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import MapKit

struct MapBounds {
    let coordinate1: CLLocationCoordinate2D
    let coordinate2: CLLocationCoordinate2D

    var center: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: (coordinate1.latitude + coordinate2.latitude) / 2,
                               longitude: (coordinate1.longitude + coordinate2.longitude) / 2)
    }
}

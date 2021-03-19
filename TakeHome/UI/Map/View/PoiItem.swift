//
//  PoiItem.swift
//  TakeHome
//
//  Created by Jmorgaz on 19/3/21.
//

import MapKit

struct PoiItem {

    let title: String
    let state: State
    let coordinate: CLLocationCoordinate2D

    init(poi: Poi) {
        self.title = String(poi.id)
        self.state = poi.state
        self.coordinate = CLLocationCoordinate2D(latitude: poi.coordinate.latitude,
                                                 longitude: poi.coordinate.longitude)
    }
}

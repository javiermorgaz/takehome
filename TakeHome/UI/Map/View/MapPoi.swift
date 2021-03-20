//
//  MapPoi.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import MapKit

struct MapPoi {

    let id: String
    let state: State
    let type: PoiType
    let heading: String
    let mapAnnotation: MapAnnotation

    init(poi: Poi) {
        self.id = String(poi.id)
        self.state = poi.state
        self.type = poi.type
        self.heading = String(poi.heading)
        self.mapAnnotation = MapAnnotation(title: self.id, state: self.state, coordinate: CLLocationCoordinate2D(latitude: poi.coordinate.latitude, longitude: poi.coordinate.longitude))
    }
}

class MapAnnotation: NSObject, MKAnnotation {

    var title: String?
    var state: State
    var coordinate: CLLocationCoordinate2D
    var color: UIColor? {
        switch state {
        case .active:
            return UIColor.primary
        case .inactive:
            return UIColor.secondary
        }
    }

    init(title: String, state: State, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.state = state
        self.coordinate = coordinate
    }
}

//
//  MapPoi.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import Foundation
import MapKit

class MapPoi: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D

    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

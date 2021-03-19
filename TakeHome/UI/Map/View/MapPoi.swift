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

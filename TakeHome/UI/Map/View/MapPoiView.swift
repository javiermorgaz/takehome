//
//  MapPoiView.swift
//  TakeHome
//
//  Created by Jmorgaz on 19/3/21.
//

import MapKit

class MapPoiView: MKMarkerAnnotationView {

    override var annotation: MKAnnotation? {
        willSet {
            guard let mapPoi = newValue as? MapPoi else { return }
            markerTintColor = mapPoi.color
            glyphImage = UIImage(systemName: "car.circle")
        }
    }
}

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
            guard let mapAnnotation = newValue as? MapAnnotation else { return }
            markerTintColor = mapAnnotation.color
            glyphImage = UIImage(systemName: "car.circle")
        }
    }
}

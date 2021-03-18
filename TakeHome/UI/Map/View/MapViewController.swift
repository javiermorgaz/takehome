//
//  MapViewController.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import UIKit
import MapKit

protocol MapView: BaseView {
    func updateLocation(bounds: MapBounds)
    func update(pois: [MapPoi])
}

final class MapViewController: BaseViewController, MapView {

    @IBOutlet private weak var mapView: MKMapView!

    var presenter: MapPresenter!

    func update(pois: [MapPoi]) {
        mapView.addAnnotations(pois)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapBounds = MapBounds(coordinate1: CLLocationCoordinate2D(latitude: 53.694865, longitude: 9.757589),
                                      coordinate2: CLLocationCoordinate2D(latitude: 53.394655, longitude: 10.099891))
        
        updateLocation(bounds: mapBounds)
    }
    
    func updateLocation(bounds: MapBounds) {
        let point1 = MKMapPoint(bounds.coordinate1)
        let point2 = MKMapPoint(bounds.coordinate2)

        let mapRect = MKMapRect(x: fmin(point1.x, point2.x),
                                y: fmin(point1.y, point2.y),
                                width: fabs(point1.x - point2.x),
                                height: fabs(point1.y - point2.y))
        mapView.setVisibleMapRect(mapRect, animated: true)    }
}

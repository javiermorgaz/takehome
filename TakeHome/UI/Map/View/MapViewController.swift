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
    func select(poi: MapPoi)
}

final class MapViewController: BaseViewController, MapView {

    @IBOutlet private weak var mapView: MKMapView!

    var presenter: MapViewPresenter!

    override func viewDidLoad() {

        super.viewDidLoad()

        mapView.delegate = self
        presenter.viewDidLoad()
        setUpNavigationBar()
    }

    func update(pois: [MapPoi]) {
        mapView.addAnnotations(pois)
    }

    func updateLocation(bounds: MapBounds) {

        let mapOriginPoint = MKMapPoint(bounds.coordinate1)
        let mapBoundsPoint = MKMapPoint(bounds.coordinate2)

        let mapRectangle = MKMapRect(origin: mapOriginPoint,
                                size: MKMapSize(width: fabs(mapOriginPoint.x - mapBoundsPoint.x),
                                                height: fabs(mapOriginPoint.y - mapBoundsPoint.y)))

        mapView.setVisibleMapRect(mapRectangle, animated: true)
    }

    func select(poi: MapPoi) {

        mapView.centerCoordinate = poi.coordinate
        mapView.selectAnnotation(poi, animated: true)
    }

    private func setUpNavigationBar() {

        showTitle("Take Home")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Taxis", style: .plain, target: self, action: #selector(didTapListButton))
    }

    @objc fileprivate func didTapListButton(_ sender: AnyObject) {
        presenter.didTapListButton()
    }
}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {

        guard !mapView.annotations.isEmpty else { return }

        let coordinate1 = mapView.visibleMapRect.origin.coordinate
        let coordinate2 = mapView.convert(CGPoint(x: mapView.bounds.width, y: mapView.bounds.height),
                                          toCoordinateFrom: mapView)

        presenter.mapRegionDidChange(MapBounds(coordinate1: coordinate1, coordinate2: coordinate2))
    }
}

private extension Selector {
    static let didTapListButton = #selector(MapViewController.didTapListButton)
}

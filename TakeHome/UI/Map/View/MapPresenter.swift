//
//  MapPresenter.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import Foundation
import Combine
import MapKit

protocol MapViewPresenter {
    func viewDidLoad()
    func didTapListButton()
    func mapRegionDidChange(_ bounds: MapBounds)
}

final class MapPresenter: MapViewPresenter {

    struct Keys {
        static let hamburgCoord1Lat: Double = 53.694865
        static let hamburgCoord1Long: Double = 9.757589
        static let hamburgCoord2Lat: Double = 53.394655
        static let hamburgCoord2Long: Double = 10.099891
    }

    private let getPoisUseCase: GetPoisUseCase
    private let router: MapRoutable

    private var cancellable = Set<AnyCancellable>()
    private weak var view: MapView?
    private var mapPois = [MapPoi]()

    init(view: MapView,
         getPoisUseCase: GetPoisUseCase,
         router: MapRoutable) {
        self.view = view
        self.getPoisUseCase = getPoisUseCase
        self.router = router
    }

    // MARK: - MapViewPresenter

    func viewDidLoad() {
        setMapRegion()
    }

    func didTapListButton() {
        router.showList()
    }

    func mapRegionDidChange(_ bounds: MapBounds) {
        getPois(bounds)
    }

    // MARK: - Private

    private func setMapRegion() {

        let mapBounds = MapBounds(coordinate1: CLLocationCoordinate2D(latitude: Keys.hamburgCoord1Lat, longitude: Keys.hamburgCoord1Long),
                                  coordinate2: CLLocationCoordinate2D(latitude: Keys.hamburgCoord2Lat, longitude: Keys.hamburgCoord2Long))

        view?.updateLocation(bounds: mapBounds)
        getPois(mapBounds)
    }

    private func getPois(_ bounds: MapBounds) {

        let bounds = Bounds(p1Lon: bounds.coordinate1.longitude, p1Lat: bounds.coordinate1.latitude, p2Lon: bounds.coordinate2.longitude, p2Lat: bounds.coordinate2.latitude)

        getPoisUseCase.execute(bounds: bounds)
            .receive(on: DispatchQueue.main)
            .map { $0.poiList }
            .sink(receiveCompletion: { error in
                switch error {
                case .finished:
                    break
                case .failure:
                    break
                }
            }, receiveValue: { [weak self] poiList in
                self?.mapPois = poiList.map {
                    MapPoi(title: String($0.id),
                           state: $0.state,
                           coordinate: CLLocationCoordinate2D(latitude: $0.coordinate.latitude,
                                                              longitude: $0.coordinate.longitude)) }
                self?.updatePois()
            })
            .store(in: &cancellable)
    }

    private func updatePois() {
        view?.update(pois: mapPois)
    }
}

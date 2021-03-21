//
//  MapPresenter.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import Combine
import MapKit

// sourcery: AutoMockable
protocol MapViewPresenter {
    func viewDidLoad()
    func didTapListButton()
    func mapRegionDidChange(_ bounds: MapBounds)
}

protocol MapViewDelegate: class {
    func didTapItem(index: Int)
    func didTapDoneButton()
}

final class MapPresenter: MapViewPresenter {

    private enum Keys {
        static let hamburgCoord1Lat: Double = 53.694865
        static let hamburgCoord1Long: Double = 9.757589
        static let hamburgCoord2Lat: Double = 53.394655
        static let hamburgCoord2Long: Double = 10.099891
    }

    private let getPoisUseCase: GetPoisUseCase
    private let router: MapRoutable

    private var cancellable = Set<AnyCancellable>()
    private weak var view: MapView?
    private var pois = [MapPoi]()
    private var location: CLLocationCoordinate2D?

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
        router.showList(pois, location: location, delegate: self)
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

    private func getPois(_ mapBounds: MapBounds) {

        let bounds = Bounds(p1Lon: mapBounds.coordinate1.longitude, p1Lat: mapBounds.coordinate1.latitude, p2Lon: mapBounds.coordinate2.longitude, p2Lat: mapBounds.coordinate2.latitude)

        location = mapBounds.center

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
                self?.pois = poiList.map { MapPoi(poi: $0) }
                self?.updatePois()
            })
            .store(in: &cancellable)
    }

    private func updatePois() {
        view?.update(pois: pois)
    }
}

extension MapPresenter: MapViewDelegate {

    func didTapItem(index: Int) {
        view?.select(poi: pois[index])
        router.dismiss()
    }

    func didTapDoneButton() {
        router.dismiss()
    }
}

//
//  MapPresenter.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import Foundation
import Combine
import MapKit

final class MapPresenter {

    private var cancellable = Set<AnyCancellable>()
    private weak var view: MapView?

    init(view: MapView) {
        self.view = view
        getPois()
    }

    private func getPois() {
        
//        view?.updateLocation(bounds: mapBounds)
        
        let bounds = Bounds(p1Lon: 9.757589, p1Lat: 53.694865, p2Lon: 10.099891, p2Lat: 53.394655)

        PoisAPI(restClient: RestClient(baseUrl: Constants.baseURL)).getPois(bounds)
            .receive(on: DispatchQueue.main)
            .map { $0.poiList }
            .sink(receiveCompletion: { error in
                switch error {
                case .finished:
                    break
                case .failure:
                    break
                }
            }, receiveValue: { poiList in
                self.view?.update(pois: poiList.map { MapPoi(title: String($0.id), coordinate: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)) })
            })
            .store(in: &cancellable)
    }
}

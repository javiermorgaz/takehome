//
//  ListPresenter.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import MapKit

protocol ListViewPresenter {
    func viewDidLoad()
    func didTapItem(index: Int)
    func didTapDoneButton()
}

final class ListPresenter: ListViewPresenter {

    private weak var view: ListView?
    private let items: [MapPoi]
    private let location: CLLocationCoordinate2D?
    private weak var delegate: MapViewDelegate?

    init(view: ListView,
         items: [MapPoi],
         location: CLLocationCoordinate2D?,
         delegate: MapViewDelegate?) {
        self.view = view
        self.items = items
        self.location = location
        self.delegate = delegate
    }

    // MARK: - ListViewPresenter

    func viewDidLoad() {
        view?.update(items: items)
        getLocation()
    }

    func didTapItem(index: Int) {
        delegate?.didTapItem(index: index)
    }

    func didTapDoneButton() {
        delegate?.didTapDoneButton()
    }

    func getLocation() {
        guard let location = location else {
            self.view?.update(location: "Error location")
            return
        }
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: location.latitude, longitude: location.longitude)) { location, _ in
            guard let city = location?.first?.locality else {
                self.view?.update(location: "Error location")
                return
            }
            self.view?.update(location: city)
        }
    }
}

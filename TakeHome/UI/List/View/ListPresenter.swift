//
//  ListPresenter.swift
//  TakeHome
//
//  Created by Jmorgaz on 18/3/21.
//

import MapKit

// sourcery: AutoMockable
protocol ListViewPresenter: Presenter {
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
        if items.isEmpty {
            view?.showInfoView(message: NSLocalizedString("noVehicles", comment: "No vechicles description"))
        } else {
            view?.update(items: items)
        }
        getLocationCity()
    }

    func didTapItem(index: Int) {
        delegate?.didTapItem(index: index)
    }

    func didTapDoneButton() {
        delegate?.didTapDoneButton()
    }

    func getLocationCity() {

        guard let location = location else { return }
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: location.latitude, longitude: location.longitude)) { location, _ in
            guard let city = location?.first?.locality else { return }
            self.view?.update(location: city)
        }
    }
}

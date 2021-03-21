//
//  MapViewTests.swift
//  TakeHomeTests
//
//  Created by Jmorgaz on 21/3/21.
//

// swiftlint:disable overridden_super_call

import XCTest
import Nimble
import MapKit
@testable import TakeHome

class MapViewTests: XCTestCase {

    private var presenter: MapViewPresenterMock!

    override func setUpWithError() throws {

        presenter = MapViewPresenterMock()
    }

    func test_view_did_load() {

        let view = givenView()
        view.viewDidLoad()

        expect(self.presenter.viewDidLoadCalled).to(beTrue())
    }

    func test_did_tap_in_item() {

        let view = givenView()
        view.mapView(MKMapView(), regionDidChangeAnimated: true)

        expect(self.presenter.mapRegionDidChangeCalled).to(beTrue())
    }

    private func givenView() -> MapViewController {

        let view = MapViewController()
        view.loadView()
        view.mapPresenter = presenter
        return view
    }
}

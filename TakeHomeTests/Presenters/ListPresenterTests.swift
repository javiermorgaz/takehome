//
//  ListPresenterTests.swift
//  TakeHomeTests
//
//  Created by Jmorgaz on 21/3/21.
//

// swiftlint:disable overridden_super_call

import XCTest
import Nimble
import MapKit
@testable import TakeHome

class ListPresenterTests: XCTestCase {

    private var view: ListViewMock!

    override func setUpWithError() throws {

        view = ListViewMock()
    }

    func test_show_items() {

        let presenter = givenPresenter()
        presenter.viewDidLoad()

        expect(self.view.updateItemsCalled).to(beTrue())
        expect(self.view.updateItemsReceivedItems?.count).to(equal(4))
    }

    func test_show_location() {

        let presenter = givenPresenter()
        presenter.viewDidLoad()

        expect(self.view.updateLocationCalled).toEventually(beTrue())
        expect(self.view.updateLocationReceivedLocation).to(equal("Prisdorf"))
    }

    func test_show_empty_view() {

        let presenter = givenPresenterWithNoItems()
        presenter.viewDidLoad()

        expect(self.view.showInfoViewMessageCalled).toEventually(beTrue())
    }

    private func givenPresenter() -> ListViewPresenter {
        ListPresenter(view: view, items: givenMapPois(), location: givenLocation(), delegate: nil)
    }

    private func givenPresenterWithNoItems() -> ListViewPresenter {
        ListPresenter(view: view, items: [MapPoi](), location: givenLocation(), delegate: nil)
    }

    private func givenMapPois() -> [MapPoi] {
        givenPois().map { MapPoi(poi: $0) }
    }

    private func givenPois() -> [Poi] {
        let results: PoisDTO = TestUtils.jsonModel(withName: "pois")!
        return results.poiList
    }

    private func givenLocation() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 53.694865, longitude: 9.757589)
    }
}

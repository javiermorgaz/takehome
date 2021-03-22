//
//  MapPresenterTests.swift
//  TakeHomeTests
//
//  Created by Jmorgaz on 21/3/21.
//

// swiftlint:disable overridden_super_call

import XCTest
import Combine
import Nimble
import MapKit
@testable import TakeHome

class MapPresenterTests: XCTestCase {

    private var view: MapViewMock!
    private var getPoisUseCase: GetPoisUseCaseMock!
    private var mapRouter: MapRoutableMock!
    private var cancellable: Set<AnyCancellable>!
    private var presenter: MapViewPresenter!

    override func setUpWithError() throws {

        view = MapViewMock()
        getPoisUseCase = GetPoisUseCaseMock()
        mapRouter = MapRoutableMock()
        presenter = givenPresenter()
        cancellable = Set<AnyCancellable>()
    }

    func test_set_map_region_at_init() {

        givenPois()
        presenter.viewDidLoad()

        expect(self.view.updateLocationBoundsCalled).to(beTrue())
    }

    func test_get_pois_sucess_at_init() {

        givenPois()
        presenter.viewDidLoad()

        let pois = givenPoisDTO().poiList.map { MapPoi(poi: $0) }

        expect(self.view.updatePoisReceivedPois?[0].id).toEventually(equal(pois[0].id))
        expect(self.view.updatePoisReceivedPois?[1].id).toEventually(equal(pois[1].id))
        expect(self.view.updatePoisReceivedPois?[2].id).toEventually(equal(pois[2].id))
        expect(self.view.updatePoisReceivedPois?[3].id).toEventually(equal(pois[3].id))
    }

    func test_fails() {

        givenErrorEmptyPois()
        presenter.viewDidLoad()

        expect(self.view.updatePoisReceivedPois).toEventually(beNil())
    }

    func test_show_map_pois_at_init() {

        givenPois()
        presenter.viewDidLoad()

        expect(self.view.updatePoisCalled).toEventually(beTrue())
    }

    func test_map_region_change() {

        givenPois()
        presenter.mapRegionDidChange(givenMapBouds())

        expect(self.view.updatePoisCalled).toEventually(beTrue())
    }

    func test_open_list_screen() {

        presenter.didTapListButton()

        expect(self.mapRouter.showListLocationDelegateCalled).to(beTrue())
    }

    private func givenPois() {
        getPoisUseCase.executeBoundsReturnValue = Just.init(givenPoisDTO())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    private func givenErrorEmptyPois() {
        getPoisUseCase.executeBoundsReturnValue = Result.failure(URLError(.unknown)).publisher.eraseToAnyPublisher()
    }

    private func givenPresenter() -> MapViewPresenter {
        MapPresenter(view: view, getPoisUseCase: getPoisUseCase, router: mapRouter)
    }

    private func givenPoisDTO() -> PoisDTO {
        let results: PoisDTO = TestUtils.jsonModel(withName: "pois")!
        return results
    }

    private func givenMapBouds() -> MapBounds {
        MapBounds(coordinate1: CLLocationCoordinate2D(latitude: 53.694865, longitude: 9.757589),
                         coordinate2: CLLocationCoordinate2D(latitude: 53.394655, longitude: 10.099891))
    }
}

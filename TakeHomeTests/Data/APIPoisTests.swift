//
//  APIPoisTests.swift
//  TakeHomeTests
//
//  Created by Jmorgaz on 21/3/21.
//

// swiftlint:disable overridden_super_call

import XCTest
import OHHTTPStubs
import Combine
import Nimble
import MapKit
@testable import TakeHome

class APIPoisTests: XCTestCase {

    private var cancellable = Set<AnyCancellable>()
    private var poisApiClient: PoisAPIClient!

    override func setUpWithError() throws {
        poisApiClient = CoreDependencies.shared.pois.providePoisAPIClient()
        cancellable = Set<AnyCancellable>()
    }

    func test_get_pois_success() {

        var pois = [Poi]()

        stubNetworkGetRequest(outputFileName: "pois")

        poisApiClient.getPois((Bounds(p1Lon: 0.0, p1Lat: 0.0, p2Lon: 0.0, p2Lat: 0.0)))
            .receive(on: DispatchQueue.main)
            .map { $0.poiList }
            .sink(receiveCompletion: { error in
                switch error {
                case .finished:
                    break
                case .failure:
                    fail("Expecting not to fail")
                }
            }, receiveValue: { poiList in
                pois = poiList
            })
            .store(in: &cancellable)

        expect(pois.count).toEventually(equal(4))
        expect(pois.first?.id).toEventually(equal(975958474))
        expect(pois.first?.coordinate.latitude).toEventually(equal(53.58536866222795))
        expect(pois.first?.coordinate.longitude).toEventually(equal(9.968962222337723))
        expect(pois.first?.state).toEventually(equal(.active))
        expect(pois.first?.type).toEventually(equal(.taxi))
        expect(pois.first?.heading).toEventually(equal(346.44281005859375))
    }

    func test_get_pois_failure() {

        stubNoConnectionError()

        poisApiClient.getPois((Bounds(p1Lon: 0.0, p1Lat: 0.0, p2Lon: 0.0, p2Lat: 0.0)))
            .receive(on: DispatchQueue.main)
            .map { $0.poiList }
            .sink(receiveCompletion: { error in
                expect(error).toNot(beNil())
            }, receiveValue: { _ in
                fail("Expecting to get failure callback")
            })
            .store(in: &cancellable)
    }

    private func stubNetworkGetRequest(outputFileName: String) {
        stub(condition: isHost("poi-api.mytaxi.com")
                && isMethodGET()) { _ in
            guard let stubPath = OHPathForFile("\(outputFileName).json", type(of: self)) else {
                preconditionFailure("Could not find expected file in test bundle: \(outputFileName)")
            }
            return fixture(filePath: stubPath,
                           headers: ["Content-Type": "application/json"] as [NSObject: AnyObject])
        }
    }

    private func stubNoConnectionError() {
        stub(condition: isHost("poi-api.mytaxi.com")) { _ in
            let notConnectedError = NSError(domain: NSURLErrorDomain, code: URLError.notConnectedToInternet.rawValue)
            return HTTPStubsResponse(error: notConnectedError)
        }
    }
}

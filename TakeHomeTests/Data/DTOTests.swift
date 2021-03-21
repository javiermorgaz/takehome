//
//  DTOTests.swift
//  TakeHomeTests
//
//  Created by Jmorgaz on 21/3/21.
//

import XCTest
@testable import TakeHome

class IDResultsDTOTests: XCTestCase {

    func test_create_pois_dto_from_json() throws {

        let results: PoisDTO = TestUtils.jsonModel(withName: "pois")!

        XCTAssertEqual(results.poiList.count, 4)
    }

    func test_create_poi_dto_from_json() throws {

        let results: PoisDTO = TestUtils.jsonModel(withName: "pois")!
        let result = results.poiList.first

        XCTAssertEqual(result?.id, 975958474)
        XCTAssertEqual(result?.coordinate.latitude, 53.58536866222795)
        XCTAssertEqual(result?.coordinate.longitude, 9.968962222337723)
        XCTAssertEqual(result?.state, .active)
        XCTAssertEqual(result?.type, .taxi)
        XCTAssertEqual(result?.heading, 346.44281005859375)
    }
}

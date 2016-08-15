//
//  PrecipitationTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/24/16.
//
//

import XCTest
@testable import ForecastIO

class PrecipitationTests: XCTestCase {

    func testDescription() {
        //  Given
        //  When
        //  Then
        XCTAssertEqual(Precipitation.Rain.description, "rain")
        XCTAssertEqual(Precipitation.Snow.description, "snow")
        XCTAssertEqual(Precipitation.Sleet.description, "sleet")
        XCTAssertEqual(Precipitation.Hail.description, "hail")
    }

}

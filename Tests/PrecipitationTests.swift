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
        // Given
        // When
        // Then
        XCTAssertEqual(Precipitation.rain.rawValue, "rain")
        XCTAssertEqual(Precipitation.snow.rawValue, "snow")
        XCTAssertEqual(Precipitation.sleet.rawValue, "sleet")
        XCTAssertEqual(Precipitation.hail.rawValue, "hail")
    }

}

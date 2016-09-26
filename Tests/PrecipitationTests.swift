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
        XCTAssertEqual(Precipitation.Rain.rawValue, "rain")
        XCTAssertEqual(Precipitation.Snow.rawValue, "snow")
        XCTAssertEqual(Precipitation.Sleet.rawValue, "sleet")
        XCTAssertEqual(Precipitation.Hail.rawValue, "hail")
    }

}

//
//  IconTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/24/16.
//
//

import XCTest
@testable import ForecastIO

class IconTests: XCTestCase {

    func testRawValue() {
        // Given
        // When
        // Then
        XCTAssertEqual(Icon.clearDay.rawValue, "clear-day")
        XCTAssertEqual(Icon.clearNight.rawValue, "clear-night")
        XCTAssertEqual(Icon.rain.rawValue, "rain")
        XCTAssertEqual(Icon.snow.rawValue, "snow")
        XCTAssertEqual(Icon.sleet.rawValue, "sleet")
        XCTAssertEqual(Icon.wind.rawValue, "wind")
        XCTAssertEqual(Icon.fog.rawValue, "fog")
        XCTAssertEqual(Icon.cloudy.rawValue, "cloudy")
        XCTAssertEqual(Icon.partlyCloudyDay.rawValue, "partly-cloudy-day")
        XCTAssertEqual(Icon.partlyCloudyNight.rawValue, "partly-cloudy-night")
    }

}

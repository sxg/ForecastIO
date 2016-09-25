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
        //  Given
        //  When
        //  Then
        XCTAssertEqual(Icon.ClearDay.rawValue, "clear-day")
        XCTAssertEqual(Icon.ClearNight.rawValue, "clear-night")
        XCTAssertEqual(Icon.Rain.rawValue, "rain")
        XCTAssertEqual(Icon.Snow.rawValue, "snow")
        XCTAssertEqual(Icon.Sleet.rawValue, "sleet")
        XCTAssertEqual(Icon.Wind.rawValue, "wind")
        XCTAssertEqual(Icon.Fog.rawValue, "fog")
        XCTAssertEqual(Icon.Cloudy.rawValue, "cloudy")
        XCTAssertEqual(Icon.PartlyCloudyDay.rawValue, "partly-cloudy-day")
        XCTAssertEqual(Icon.PartlyCloudyNight.rawValue, "partly-cloudy-night")
    }

}

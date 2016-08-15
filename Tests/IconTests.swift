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

    func testDescription() {
        //  Given
        //  When
        //  Then
        XCTAssertEqual(Icon.ClearDay.description, "clear-day")
        XCTAssertEqual(Icon.ClearNight.description, "clear-night")
        XCTAssertEqual(Icon.Rain.description, "rain")
        XCTAssertEqual(Icon.Snow.description, "snow")
        XCTAssertEqual(Icon.Sleet.description, "sleet")
        XCTAssertEqual(Icon.Wind.description, "wind")
        XCTAssertEqual(Icon.Fog.description, "fog")
        XCTAssertEqual(Icon.Cloudy.description, "cloudy")
        XCTAssertEqual(Icon.PartlyCloudyDay.description, "partly-cloudy-day")
        XCTAssertEqual(Icon.PartlyCloudyNight.description, "partly-cloudy-night")
    }

}

//
//  ForecastFieldTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 6/18/16.
//
//

import XCTest
@testable import ForecastIO

class ForecastFieldTests: XCTestCase {
    
    func testDescription() {
        //  Given
        //  When
        //  Then
        XCTAssertEqual(ForecastField.Currently.description, "currently")
        XCTAssertEqual(ForecastField.Minutely.description, "minutely")
        XCTAssertEqual(ForecastField.Hourly.description, "hourly")
        XCTAssertEqual(ForecastField.Daily.description, "daily")
        XCTAssertEqual(ForecastField.Alerts.description, "alerts")
        XCTAssertEqual(ForecastField.Flags.description, "flags")
    }
    
}


//
//  UnitsTest.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
@testable import ForecastIO

class UnitsTests: XCTestCase {
    
    func testDescription() {
        // Given
        // When
        // Then
        XCTAssertEqual(Units.si.rawValue, "si")
        XCTAssertEqual(Units.us.rawValue, "us")
        XCTAssertEqual(Units.ca.rawValue, "ca")
        XCTAssertEqual(Units.uk.rawValue, "uk2")
        XCTAssertEqual(Units.auto.rawValue, "auto")
    }
    
}

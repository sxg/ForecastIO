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
        //  Given
        //  When
        //  Then
        XCTAssertEqual(Units.SI.description, "si")
        XCTAssertEqual(Units.US.description, "us")
        XCTAssertEqual(Units.CA.description, "ca")
        XCTAssertEqual(Units.UK.description, "uk")
        XCTAssertEqual(Units.UK2.description, "uk2")
        XCTAssertEqual(Units.Auto.description, "auto")
    }
    
}

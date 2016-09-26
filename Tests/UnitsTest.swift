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
        XCTAssertEqual(Units.SI.rawValue, "si")
        XCTAssertEqual(Units.US.rawValue, "us")
        XCTAssertEqual(Units.CA.rawValue, "ca")
        XCTAssertEqual(Units.UK.rawValue, "uk")
        XCTAssertEqual(Units.UK2.rawValue, "uk2")
        XCTAssertEqual(Units.Auto.rawValue, "auto")
    }
    
}

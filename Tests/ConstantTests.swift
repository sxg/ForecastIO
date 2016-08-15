//
//  ConstantTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/24/16.
//
//

import XCTest
@testable import ForecastIO

class ConstantTests: XCTestCase {

    func testDescription() {
        //  Given
        //  When
        //  Then
        XCTAssertEqual(ForecastIOErrorDomain, "ForecastIOErrorDomain")
        XCTAssertEqual(ForecastIOErrorBadJSON, 1)
    }

}

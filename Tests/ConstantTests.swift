//
//  ConstantTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/24/16.
//
//

import XCTest
import Nimble
@testable import ForecastIO

class ConstantTests: XCTestCase {

    func testDescription() {
        //  Given
        //  When
        //  Then
        expect(ForecastIOErrorDomain).to(equal("ForecastIOErrorDomain"))
        expect(ForecastIOErrorBadJSON).to(equal(1))
    }

}

//
//  UnitsTest.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
import Nimble
@testable import ForecastIO

class UnitsTests: XCTestCase {
    
    func testDescription() {
        //  Given
        //  When
        //  Then
        expect(Units.SI.description).to(equal("si"))
        expect(Units.US.description).to(equal("us"))
        expect(Units.CA.description).to(equal("ca"))
        expect(Units.UK.description).to(equal("uk"))
        expect(Units.UK2.description).to(equal("uk2"))
        expect(Units.Auto.description).to(equal("auto"))
    }
    
}

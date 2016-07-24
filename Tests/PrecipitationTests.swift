//
//  PrecipitationTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/24/16.
//
//

import XCTest
import Nimble
@testable import ForecastIO

class PrecipitationTests: XCTestCase {

    func testDescription() {
        //  Given
        //  When
        //  Then
        expect(Precipitation.Rain.description).to(equal("rain"))
        expect(Precipitation.Snow.description).to(equal("snow"))
        expect(Precipitation.Sleet.description).to(equal("sleet"))
        expect(Precipitation.Hail.description).to(equal("hail"))
    }

}

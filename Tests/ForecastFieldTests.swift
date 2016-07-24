//
//  ForecastFieldTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 6/18/16.
//
//

import XCTest
import Nimble
@testable import ForecastIO

class ForecastFieldTests: XCTestCase {
    
    func testDescription() {
        //  Given
        //  When
        //  Then
        expect(ForecastField.Currently.description).to(equal("currently"))
        expect(ForecastField.Minutely.description).to(equal("minutely"))
        expect(ForecastField.Hourly.description).to(equal("hourly"))
        expect(ForecastField.Daily.description).to(equal("daily"))
        expect(ForecastField.Alerts.description).to(equal("alerts"))
        expect(ForecastField.Flags.description).to(equal("flags"))
    }
    
}


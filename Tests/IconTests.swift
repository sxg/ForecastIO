//
//  IconTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/24/16.
//
//

import XCTest
import Nimble
@testable import ForecastIO

class IconTests: XCTestCase {

    func testDescription() {
        //  Given
        //  When
        //  Then
        expect(Icon.ClearDay.description).to(equal("clear-day"))
        expect(Icon.ClearNight.description).to(equal("clear-night"))
        expect(Icon.Rain.description).to(equal("rain"))
        expect(Icon.Snow.description).to(equal("snow"))
        expect(Icon.Sleet.description).to(equal("sleet"))
        expect(Icon.Wind.description).to(equal("wind"))
        expect(Icon.Fog.description).to(equal("fog"))
        expect(Icon.Cloudy.description).to(equal("cloudy"))
        expect(Icon.PartlyCloudyDay.description).to(equal("partly-cloudy-day"))
        expect(Icon.PartlyCloudyNight.description).to(equal("partly-cloudy-night"))
    }

}

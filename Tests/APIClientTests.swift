//
//  APIClientTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
import Nimble
import ForecastIO
import OHHTTPStubs

class APIClientTests: XCTestCase {
    
    override func setUp() {
        stub(isHost("https://api.forecast.io/forecast/")) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
    }
    
    func testInit() {
        //  Given
        //  When
        let client = APIClient(apiKey: "FAKE API KEY")
        
        //  Then
        expect(client).toNot(beNil())
    }
    
}

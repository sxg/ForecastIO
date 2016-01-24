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
        super.setUp()
        
        stub(isHost("api.forecast.io")) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    func testInit() {
        //  Given
        //  When
        let client = APIClient(apiKey: "FAKE-API-KEY")
        
        //  Then
        expect(client).toNot(beNil())
    }
    
    func testGetForecast() {
        //  Given
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        
        //  When
        client.getForecast(latitude: 41.499320, longitude: -81.694361) { (currentForecast, error) -> Void in
            forecast = currentForecast
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
    }
    
    func testGetForecastForTime() {
        //  Given
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        
        //  When
        client.getForecast(latitude: 41.499320, longitude: -81.694361, time: NSDate()) { (aForecast, error) -> Void in
            forecast = aForecast
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
    }
    
}

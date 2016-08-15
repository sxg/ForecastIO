//
//  ForecastTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
@testable import ForecastIO

class ForecastTests: XCTestCase {
    
    var forecastJSON: NSDictionary!
    var forecastBareJSON: NSDictionary!
    
    override func setUp() {
        super.setUp()
        
        let forecastJSONPath = NSBundle(forClass: self.dynamicType).pathForResource("forecast", ofType: "json")!
        let forecastJSONData = NSData(contentsOfFile: forecastJSONPath)!
        self.forecastJSON = try! NSJSONSerialization.JSONObjectWithData(forecastJSONData, options: .MutableContainers) as! NSDictionary
        
        let forecastBareJSONPath = NSBundle(forClass: self.dynamicType).pathForResource("forecast_bare", ofType: "json")!
        let forecastBareJSONData = NSData(contentsOfFile: forecastBareJSONPath)!
        self.forecastBareJSON = try! NSJSONSerialization.JSONObjectWithData(forecastBareJSONData, options: .MutableContainers) as! NSDictionary
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFromJSON() {
        //  Given
        //  When
        let forecast = Forecast(fromJSON: self.forecastJSON)
        
        //  Then
        XCTAssertNotNil(forecast)
        XCTAssertEqual(forecast.latitude, 39.290385)
        XCTAssertEqual(forecast.longitude, -76.612189)
        XCTAssertEqual(forecast.timezone, "America/New_York")
        XCTAssertEqual(forecast.offset, -5)
        XCTAssertNotNil(forecast.currently)
        XCTAssertNotNil(forecast.minutely)
        XCTAssertNotNil(forecast.hourly)
        XCTAssertNotNil(forecast.daily)
    }
    
    func testInitBareFromJSON() {
        //  Given
        //  When
        let forecast = Forecast(fromJSON: self.forecastBareJSON)
        
        //  Then
        XCTAssertNotNil(forecast)
        XCTAssertEqual(forecast.latitude, 39.290385)
        XCTAssertEqual(forecast.longitude, -76.612189)
        XCTAssertEqual(forecast.timezone, "America/New_York")
        XCTAssertNil(forecast.offset)
        XCTAssertNil(forecast.currently)
        XCTAssertNil(forecast.minutely)
        XCTAssertNil(forecast.hourly)
        XCTAssertNil(forecast.daily)
    }
    
}
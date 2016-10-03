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
        
        let forecastJSONPath = Bundle(for: type(of: self)).path(forResource: "forecast", ofType: "json")!
        let forecastJSONData = try! Data(contentsOf: URL(fileURLWithPath: forecastJSONPath))
        self.forecastJSON = try! JSONSerialization.jsonObject(with: forecastJSONData, options: .mutableContainers) as! NSDictionary
        
        let forecastBareJSONPath = Bundle(for: type(of: self)).path(forResource: "forecast_bare", ofType: "json")!
        let forecastBareJSONData = try! Data(contentsOf: URL(fileURLWithPath: forecastBareJSONPath))
        self.forecastBareJSON = try! JSONSerialization.jsonObject(with: forecastBareJSONData, options: .mutableContainers) as! NSDictionary
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
        XCTAssertNil(forecast.currently)
        XCTAssertNil(forecast.minutely)
        XCTAssertNil(forecast.hourly)
        XCTAssertNil(forecast.daily)
    }
    
    func testFieldRawValue() {
        //  Given
        //  When
        //  Then
        XCTAssertEqual(Forecast.Field.currently.rawValue, "currently")
        XCTAssertEqual(Forecast.Field.minutely.rawValue, "minutely")
        XCTAssertEqual(Forecast.Field.hourly.rawValue, "hourly")
        XCTAssertEqual(Forecast.Field.daily.rawValue, "daily")
        XCTAssertEqual(Forecast.Field.alerts.rawValue, "alerts")
        XCTAssertEqual(Forecast.Field.flags.rawValue, "flags")
    }
    
}

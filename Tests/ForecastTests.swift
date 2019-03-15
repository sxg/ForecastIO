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
    
    var forecastJSONData: Data!
    var forecastBareJSONData: Data!
    var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        
        // Load forecast.json as Data
        let forecastJSONPath = Bundle(for: type(of: self)).path(forResource: "forecast", ofType: "json")!
        self.forecastJSONData = try! Data(contentsOf: URL(fileURLWithPath: forecastJSONPath))
        
        // Load forecast_bare.json as Data
        let forecastBareJSONPath = Bundle(for: type(of: self)).path(forResource: "forecast_bare", ofType: "json")!
        self.forecastBareJSONData = try! Data(contentsOf: URL(fileURLWithPath: forecastBareJSONPath))
        
        // Setup the decoder
        self.decoder = JSONDecoder()
        self.decoder.dateDecodingStrategy = .secondsSince1970
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFromDecoder() {
        // Given
        // When
        let forecast = try! self.decoder.decode(Forecast.self, from: self.forecastJSONData)
        
        // Then
        XCTAssertNotNil(forecast)
        XCTAssertEqual(forecast.latitude, 39.290385)
        XCTAssertEqual(forecast.longitude, -76.612189)
        XCTAssertEqual(forecast.timezone, "America/New_York")
        XCTAssertNotNil(forecast.currently)
        XCTAssertNotNil(forecast.minutely)
        XCTAssertNotNil(forecast.hourly)
        XCTAssertNotNil(forecast.daily)
    }
    
    func testInitFromDecoderBare() {
        // Given
        // When
        let forecast = try! self.decoder.decode(Forecast.self, from: self.forecastBareJSONData)
        
        // Then
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
        // Given
        // When
        // Then
        XCTAssertEqual(Forecast.Field.currently.rawValue, "currently")
        XCTAssertEqual(Forecast.Field.minutely.rawValue, "minutely")
        XCTAssertEqual(Forecast.Field.hourly.rawValue, "hourly")
        XCTAssertEqual(Forecast.Field.daily.rawValue, "daily")
        XCTAssertEqual(Forecast.Field.alerts.rawValue, "alerts")
        XCTAssertEqual(Forecast.Field.flags.rawValue, "flags")
    }
    
}

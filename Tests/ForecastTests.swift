//
//  ForecastTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
import Nimble
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
        expect(forecast).toNot(beNil())
        expect(forecast.latitude).to(equal(39.290385))
        expect(forecast.longitude).to(equal(-76.612189))
        expect(forecast.timezone).to(equal("America/New_York"))
        expect(forecast.offset).to(equal(-5))
        expect(forecast.currently).toNot(beNil())
        expect(forecast.minutely).toNot(beNil())
        expect(forecast.hourly).toNot(beNil())
        expect(forecast.daily).toNot(beNil())
    }
    
    func testInitBareFromJSON() {
        //  Given
        //  When
        let forecast = Forecast(fromJSON: self.forecastBareJSON)
        
        //  Then
        expect(forecast).toNot(beNil())
        expect(forecast.latitude).to(equal(39.290385))
        expect(forecast.longitude).to(equal(-76.612189))
        expect(forecast.timezone).to(equal("America/New_York"))
        expect(forecast.offset).to(beNil())
        expect(forecast.currently).to(beNil())
        expect(forecast.minutely).to(beNil())
        expect(forecast.hourly).to(beNil())
        expect(forecast.daily).to(beNil())
    }
    
}
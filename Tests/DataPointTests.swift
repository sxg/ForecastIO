//
//  DataPointTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
import Nimble
@testable import ForecastIO

class DataPointTests: XCTestCase {
    
    var dataPointJSON: NSDictionary!
    
    override func setUp() {
        super.setUp()
        
        let forecastJSONPath = Bundle(for: self.dynamicType).path(forResource: "forecast", ofType: "json")!
        let forecastJSONData = try! Data(contentsOf: URL(fileURLWithPath: forecastJSONPath))
        let forecastJSON = try! JSONSerialization.jsonObject(with: forecastJSONData, options: .mutableContainers) as! NSDictionary
        self.dataPointJSON = forecastJSON["currently"] as! NSDictionary
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFromJSON() {
        //  Given
        //  When
        let dataPoint = DataPoint(fromJSON: self.dataPointJSON)
        
        //  Then
        expect(dataPoint).toNot(beNil())
        expect(dataPoint.time).to(equal(Date(timeIntervalSince1970: 1453575677)))
        expect(dataPoint.summary).to(equal("Snow"))
        expect(dataPoint.icon).to(equal(Icon.Snow))
        expect(dataPoint.precipType).to(equal(Precipitation.Snow))
    }
    
}


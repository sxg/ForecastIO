//
//  FlagTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
import Nimble
@testable import ForecastIO

class FlagTests: XCTestCase {
    
    var flagJSON: NSDictionary!
    
    override func setUp() {
        super.setUp()
        
        let forecastJSONPath = Bundle(for: self.dynamicType).path(forResource: "forecast", ofType: "json")!
        let forecastJSONData = try! Data(contentsOf: URL(fileURLWithPath: forecastJSONPath))
        let forecastJSON = try! JSONSerialization.jsonObject(with: forecastJSONData, options: .mutableContainers) as! NSDictionary
        self.flagJSON = forecastJSON["flags"] as! NSDictionary
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFromJSON() {
        //  Given
        //  When
        let flag = Flag(fromJSON: flagJSON)
        
        //  Then
        expect(flag).toNot(beNil())
    }
    
}

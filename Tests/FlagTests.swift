//
//  FlagTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
@testable import ForecastIO

class FlagTests: XCTestCase {
    
    var flagJSON: NSDictionary!
    
    override func setUp() {
        super.setUp()
        
        let forecastJSONPath = NSBundle(forClass: self.dynamicType).pathForResource("forecast", ofType: "json")!
        let forecastJSONData = NSData(contentsOfFile: forecastJSONPath)!
        let forecastJSON = try! NSJSONSerialization.JSONObjectWithData(forecastJSONData, options: .MutableContainers) as! NSDictionary
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
        XCTAssertNotNil(flag)
    }
    
}

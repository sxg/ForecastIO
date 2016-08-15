//
//  DataBlockTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
@testable import ForecastIO

class DataBlockTests: XCTestCase {
    
    var dataBlockJSON: NSDictionary!
    var dataBlockNoOptionalsJSON: NSDictionary!
    
    override func setUp() {
        super.setUp()
        
        let forecastJSONPath = NSBundle(forClass: self.dynamicType).pathForResource("forecast", ofType: "json")!
        let forecastJSONData = NSData(contentsOfFile: forecastJSONPath)!
        let forecastJSON = try! NSJSONSerialization.JSONObjectWithData(forecastJSONData, options: .MutableContainers) as! NSDictionary
        self.dataBlockJSON = forecastJSON["minutely"] as! NSDictionary
        
        let forecastNoOptionalsJSONPath = NSBundle(forClass: self.dynamicType).pathForResource("forecast_no_optionals", ofType: "json")!
        let forecastNoOptionalsJSONData = NSData(contentsOfFile: forecastNoOptionalsJSONPath)!
        let forecastNoOptionalsJSON = try! NSJSONSerialization.JSONObjectWithData(forecastNoOptionalsJSONData, options: .MutableContainers) as! NSDictionary
        self.dataBlockNoOptionalsJSON = forecastNoOptionalsJSON["minutely"] as! NSDictionary
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFromJSON() {
        //  Given
        //  When
        let dataBlock = DataBlock(fromJSON: self.dataBlockJSON)
        
        //  Then
        XCTAssertNotNil(dataBlock)
        XCTAssertEqual(dataBlock.summary, "Snow for the hour.")
        XCTAssertEqual(dataBlock.icon, Icon.Snow)
        XCTAssertFalse(dataBlock.data.isEmpty)
    }
    
    func testInitNoOptionalsFromJSON() {
        //  Given
        //  When
        let dataBlock = DataBlock(fromJSON: self.dataBlockNoOptionalsJSON)
        
        //  Then
        XCTAssertNotNil(dataBlock)
        XCTAssertNil(dataBlock.summary)
        XCTAssertNil(dataBlock.icon)
        XCTAssertNil(dataBlock.data)
    }
    
}

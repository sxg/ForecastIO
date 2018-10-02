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
        
        let forecastJSONPath = Bundle(for: type(of: self)).path(forResource: "forecast", ofType: "json")!
        let forecastJSONData = try! Data(contentsOf: URL(fileURLWithPath: forecastJSONPath))
        let forecastJSON = try! JSONSerialization.jsonObject(with: forecastJSONData, options: .mutableContainers) as! NSDictionary
        self.dataBlockJSON = forecastJSON["minutely"] as? NSDictionary
        
        let forecastNoOptionalsJSONPath = Bundle(for: type(of: self)).path(forResource: "forecast_no_optionals", ofType: "json")!
        let forecastNoOptionalsJSONData = try! Data(contentsOf: URL(fileURLWithPath: forecastNoOptionalsJSONPath))
        let forecastNoOptionalsJSON = try! JSONSerialization.jsonObject(with: forecastNoOptionalsJSONData, options: .mutableContainers) as! NSDictionary
        self.dataBlockNoOptionalsJSON = forecastNoOptionalsJSON["minutely"] as? NSDictionary
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
        XCTAssertEqual(dataBlock.icon, Icon.snow)
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
        XCTAssertNotNil(dataBlock.data)
    }
    
}

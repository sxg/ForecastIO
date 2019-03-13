//
//  DataPointTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
@testable import ForecastIO

class DataPointTests: XCTestCase {
    
    var dataPointJSONData: Data!
    var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        
        // Load datapoint.json as Data
        let dataPointJSONPath = Bundle(for: type(of: self)).path(forResource: "datapoint", ofType: "json")!
        self.dataPointJSONData = try! Data(contentsOf: URL(fileURLWithPath: dataPointJSONPath))
        
        // Setup the decoder
        self.decoder = JSONDecoder()
        self.decoder.dateDecodingStrategy = .secondsSince1970
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFromJSON() {
        //  Given
        //  When
//        let dataPoint = DataPoint(fromJSON: self.dataPointJSON)
        
        //  Then
//        XCTAssertNotNil(dataPoint)
//        XCTAssertEqual(dataPoint.time, Date(timeIntervalSince1970: 1453575677))
//        XCTAssertEqual(dataPoint.summary, "Snow")
//        XCTAssertEqual(dataPoint.icon, Icon.snow)
//        XCTAssertEqual(dataPoint.precipitationType, Precipitation.snow)
    }
    
    func testInitFromDecoder() {
        // Given
        // When
        let dataPoint = try! decoder.decode(DataPoint.self, from: self.dataPointJSONData)
        
        // Then
        XCTAssertNotNil(dataPoint)
        XCTAssertEqual(dataPoint.time, Date(timeIntervalSince1970: 1453575677))
        XCTAssertEqual(dataPoint.summary, "Snow")
        XCTAssertEqual(dataPoint.icon, Icon.snow)
        XCTAssertEqual(dataPoint.precipitationType, Precipitation.snow)
    }
    
}


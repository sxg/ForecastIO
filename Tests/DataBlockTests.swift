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
    
    var dataBlockJSONData: Data!
    var dataBlockNoOptionalsJSONData: Data!
    var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        
        // Load datablock.json as Data
        let dataBlockJSONPath = Bundle(for: type(of: self)).path(forResource: "datablock", ofType: "json")!
        self.dataBlockJSONData = try! Data(contentsOf: URL(fileURLWithPath: dataBlockJSONPath))
        
        // Load datablock_no_optionals.json as Data
        let dataBlockNoOptionalsJSONPath = Bundle(for: type(of: self)).path(forResource: "datablock_no_optionals", ofType: "json")!
        self.dataBlockNoOptionalsJSONData = try! Data(contentsOf: URL(fileURLWithPath: dataBlockNoOptionalsJSONPath))
        
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
        let dataBlock = try! self.decoder.decode(DataBlock.self, from: self.dataBlockJSONData)
        
        // Then
        XCTAssertNotNil(dataBlock)
        XCTAssertEqual(dataBlock.summary, "Clear for the hour.")
        XCTAssertEqual(dataBlock.icon, Icon.clearDay)
        XCTAssertFalse(dataBlock.data.isEmpty)
    }
    
    func testInitFromDecoderNoOptionals() {
        // Given
        // When
        let dataBlock = try! self.decoder.decode(DataBlock.self, from: self.dataBlockNoOptionalsJSONData)
        
        // Then
        XCTAssertNotNil(dataBlock)
        XCTAssertNil(dataBlock.summary)
        XCTAssertNil(dataBlock.icon)
        XCTAssertNotNil(dataBlock.data)
    }
    
}

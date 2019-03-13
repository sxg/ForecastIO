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
    
    var flagJSONData: Data!
    var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        
        // Load flag.json as Data
        let flagJSONPath = Bundle(for: type(of: self)).path(forResource: "flag", ofType: "json")!
        self.flagJSONData = try! Data(contentsOf: URL(fileURLWithPath: flagJSONPath))
        
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
        let flag = try! self.decoder.decode(Flag.self, from: self.flagJSONData)
        
        //  Then
        XCTAssertNotNil(flag)
    }
    
}

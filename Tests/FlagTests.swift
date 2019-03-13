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
    
    func testInitFromDecoder() {
        //  Given
        //  When
        let flag = try! self.decoder.decode(Flag.self, from: self.flagJSONData)
        
        //  Then
        XCTAssertNotNil(flag)
        XCTAssertNil(flag.darkSkyUnavailable)
        XCTAssertEqual(flag.darkSkyStations, ["KLWX", "KDOX"])
        XCTAssertNil(flag.dataPointStations)
        XCTAssertEqual(flag.isdStations, ["724060-93721", "745944-93784", "997296-99999", "997302-99999", "999999-13725"])
        XCTAssertEqual(flag.lampStations, ["KADW", "KAPG", "KBWI", "KCGS", "KDCA", "KDMH", "KDMW", "KFME", "KMTN", "KNAK"])
        XCTAssertNil(flag.metarStations)
        XCTAssertNil(flag.metnoLicense)
        XCTAssertEqual(flag.sources, ["darksky", "lamp", "gfs", "cmc", "nam", "rap", "rtma", "sref", "fnmoc", "isd", "nwspa", "madis", "nearest-precip"])
        XCTAssertEqual(flag.units, Units.us)
    }
    
}

//
//  AlertTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
@testable import ForecastIO

class AlertTests: XCTestCase {
    
    var alertsJSONData: Data!
    var alertsNoOptionalsJSONData: Data!
    var decoder: JSONDecoder!
    
    override func setUp() {
        super.setUp()
        
        // Load alerts.json as Data
        let alertsJSONPath = Bundle(for: type(of: self)).path(forResource: "alerts", ofType: "json")!
        self.alertsJSONData = try! Data(contentsOf: URL(fileURLWithPath: alertsJSONPath))
        
        // Load alerts_no_optiionals.json as Data
        let alertsNoOptionalsJSONPath = Bundle(for: type(of: self)).path(forResource: "alerts_no_optionals", ofType: "json")!
        self.alertsNoOptionalsJSONData = try! Data(contentsOf: URL(fileURLWithPath: alertsNoOptionalsJSONPath))
        
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
        let alert = try! self.decoder.decode(Alert.self, from: self.alertsJSONData)
        
        // Then
        XCTAssertNotNil(alert)
        XCTAssertEqual(alert.title, "High Wind Warning for Baltimore, MD")
        XCTAssertEqual(alert.expires, Date(timeIntervalSince1970: 1453593600))
        XCTAssertEqual(alert.uri.absoluteString, "http://alerts.weather.gov/cap/wwacapget.php?x=MD1255E4FAA7AC.HighWindWarning.1255E5079700MD.LWXNPWLWX.b0aa96f59630770f05e80c219b873fd2")
        XCTAssertEqual(alert.description, "...HIGH WIND WARNING REMAINS IN EFFECT UNTIL 7 PM EST THIS\nEVENING...\n* TIMING...THROUGH TODAY.\n* WINDS...NORTH 25 TO 35 MPH WITH GUSTS UP TO 55 MPH.\n* IMPACTS...DOWNED TREES...POWERLINES...AND MINOR STRUCTURAL\nDAMAGE. DRIVING HIGH PROFILE VEHICLES IN THESE CONDITIONS IS\nDANGEROUS.\n")
        XCTAssertEqual(alert.severity.rawValue, "watch")
        XCTAssertEqual(alert.regions, ["Eastern Bergen","Eastern Essex","Eastern Passaic","Eastern Union","Hudson","Western Bergen","Western Essex","Western Passaic","Western Union"])
        XCTAssertEqual(alert.time, Date(timeIntervalSince1970: 1453562580))
    }
    
    func testInitFromDecoderNoOptionals() {
        // Given
        // When
        let alert = try! self.decoder.decode(Alert.self, from: self.alertsNoOptionalsJSONData)
        
        // Then
        XCTAssertNotNil(alert)
        XCTAssertEqual(alert.title, "High Wind Warning for Baltimore, MD")
        XCTAssertNil(alert.expires)
        XCTAssertEqual(alert.uri.absoluteString, "http://alerts.weather.gov/cap/wwacapget.php?x=MD1255E4FAA7AC.HighWindWarning.1255E5079700MD.LWXNPWLWX.b0aa96f59630770f05e80c219b873fd2")
        XCTAssertEqual(alert.description, "...HIGH WIND WARNING REMAINS IN EFFECT UNTIL 7 PM EST THIS\nEVENING...\n* TIMING...THROUGH TODAY.\n* WINDS...NORTH 25 TO 35 MPH WITH GUSTS UP TO 55 MPH.\n* IMPACTS...DOWNED TREES...POWERLINES...AND MINOR STRUCTURAL\nDAMAGE. DRIVING HIGH PROFILE VEHICLES IN THESE CONDITIONS IS\nDANGEROUS.\n")
        XCTAssertEqual(alert.severity.rawValue, "watch")
        XCTAssertEqual(alert.regions, ["Eastern Bergen","Eastern Essex","Eastern Passaic","Eastern Union","Hudson","Western Bergen","Western Essex","Western Passaic","Western Union"])
        XCTAssertEqual(alert.time, Date(timeIntervalSince1970: 1453562580))
    }
    
}

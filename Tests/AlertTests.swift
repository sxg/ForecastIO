//
//  AlertTests.swift
//  
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
import Nimble
import ForecastIO

class AlertTests: XCTestCase {
    
    var alertsJSON: NSArray!
    
    override func setUp() {
        super.setUp()
        
        let forecastJSONPath = NSBundle(forClass: self.dynamicType).pathForResource("forecast", ofType: "json")!
        let forecastJSONData = NSData(contentsOfFile: forecastJSONPath)!
        let forecastJSON = try! NSJSONSerialization.JSONObjectWithData(forecastJSONData, options: .MutableContainers) as! NSDictionary
        self.alertsJSON = forecastJSON["alerts"] as! NSArray
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFromJSON() {
        //  Given
        let alertJSON = self.alertsJSON[0] as! NSDictionary
        
        //  When
        let alert = Alert(fromJSON: alertJSON)
        
        //  Then
        expect(alert).toNot(beNil())
        expect(alert.title).to(equal("High Wind Warning for Baltimore, MD"))
        expect(alert.expires).to(equal(NSDate(timeIntervalSince1970: 1453593600)))
        expect(alert.uri.absoluteString).to(equal("http://alerts.weather.gov/cap/wwacapget.php?x=MD1255E4FAA7AC.HighWindWarning.1255E5079700MD.LWXNPWLWX.b0aa96f59630770f05e80c219b873fd2"))
    }
    
}
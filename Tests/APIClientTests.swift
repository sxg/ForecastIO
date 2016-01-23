//
//  APIClientTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
import Nimble
import ForecastIO

class APIClientTests: XCTestCase {
    
    func testInit() {
        //  Given
        //  When
        let client = APIClient(apiKey: "FAKE API KEY")
        
        //  Then
        expect(client).toNot(beNil())
    }
    
}

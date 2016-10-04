//
//  ResultTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 10/3/16.
//
//

import XCTest
@testable import ForecastIO

class ResultTests: XCTestCase {
    
    func testSuccessfulResult() {
        //  Given
        let forecastJSONPath = Bundle(for: type(of: self)).path(forResource: "forecast", ofType: "json")!
        let forecastJSONData = try! Data(contentsOf: URL(fileURLWithPath: forecastJSONPath))
        let forecastJSON = try! JSONSerialization.jsonObject(with: forecastJSONData, options: .mutableContainers) as! NSDictionary
        let forecast = Forecast(fromJSON: forecastJSON)
        
        let httpHeaderFields = ["Cache-Control": "max-age=60", "X-Forecast-API-Calls": "12", "X-Response-Time": "123.45ms"]
        let requestMetadata = RequestMetadata(fromHTTPHeaderFields: httpHeaderFields)
        let result = Result.success(forecast, requestMetadata)
        
        //  When
        let (aForecast, aRequestMetadata) = result.value
        
        //  Then
        XCTAssertNotNil(aForecast)
        XCTAssertNotNil(aRequestMetadata)
    }
    
    func testFailureResult() {
        //  Given
        let forecastIOError = ForecastIOError.invalidJSON(Data())
        let result = Result<Forecast>.failure(forecastIOError)
        
        //  When
        let anError = result.error
        
        //  Then
        XCTAssertNotNil(anError)
    }
    
}


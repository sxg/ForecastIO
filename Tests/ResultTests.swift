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
        // Given
        let forecastJSONPath = Bundle(for: type(of: self)).path(forResource: "forecast", ofType: "json")!
        let forecastJSONData = try! Data(contentsOf: URL(fileURLWithPath: forecastJSONPath))
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let forecast = try! decoder.decode(Forecast.self, from: forecastJSONData)
        
        let httpHeaderFields = ["Cache-Control": "max-age=60", "X-Forecast-API-Calls": "12", "X-Response-Time": "123.45ms"]
        let requestMetadata = RequestMetadata(fromHTTPHeaderFields: httpHeaderFields)
        let result = Result.success(forecast, requestMetadata)
        
        // When
        let (aForecast, aRequestMetadata) = result.value
        let anError = result.error
        
        // Then
        XCTAssertNotNil(aForecast)
        XCTAssertNotNil(aRequestMetadata)
        XCTAssertNil(anError)
    }
    
    func testFailureResultMissingData() {
        // Given
        let result = Result<Forecast>.failure(ForecastIOError.missingData)
        
        // When
        let (aForecast, aRequestMetadata) = result.value
        let anError = result.error
        
        // Then
        XCTAssertNil(aForecast)
        XCTAssertNil(aRequestMetadata)
        XCTAssertNotNil(anError)
    }
    
    func testFailureResultMissingResponse() {
        // Given
        let result = Result<Forecast>.failure(ForecastIOError.missingResponse)
        
        // When
        let (aForecast, aRequestMetadata) = result.value
        let anError = result.error
        
        // Then
        XCTAssertNil(aForecast)
        XCTAssertNil(aRequestMetadata)
        XCTAssertNotNil(anError)
    }
    
    func testFailureResultUnexpectedError() {
        // Given
        let result = Result<Forecast>.failure(ForecastIOError.unexpectedError)
        
        // When
        let (aForecast, aRequestMetadata) = result.value
        let anError = result.error
        
        // Then
        XCTAssertNil(aForecast)
        XCTAssertNil(aRequestMetadata)
        XCTAssertNotNil(anError)
    }
    
}


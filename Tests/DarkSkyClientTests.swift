//
//  DarkSkyClientTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
import OHHTTPStubs
@testable import ForecastIO

class DarkSkyClientTests: XCTestCase {
    
    let apiKey = "FAKE-API-KEY"
    let latitude = 41.499320
    let longitude = -81.694361
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    func testInit() {
        // Given
        // When
        let client = DarkSkyClient(apiKey: apiKey)
        
        // Then
        XCTAssertNotNil(client)
    }
    
    func testGetForecast() {
        // Given
        let expect = expectation(description: "Get forecast")
        let hostStub = isHost("api.darksky.net")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        _ = stub(condition: hostStub && pathStub && methodStub && schemeStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", type(of: self))
            return fixture(filePath: forecastJSONPath!, headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
        }
        let client = DarkSkyClient(apiKey: apiKey)
        var forecast: Forecast?
        var metadata: RequestMetadata?
        var err: Error?
        
        // When
        client.getForecast(latitude: latitude, longitude: longitude) { (result) -> Void in
            switch result {
            case .success(let currentForecast, let requestMetadata):
                forecast = currentForecast
                metadata = requestMetadata
            case .failure(let error):
                err = error
            }
            expect.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
            XCTAssertNotNil(metadata)
            XCTAssertNil(err)
        })
    }
    
    func testGetForecastAtTime() {
        // Given
        let expect = expectation(description: "Get forecast at time")
        let time = Date()
        let timeString = String(format: "%.0f", time.timeIntervalSince1970)
        let hostStub = isHost("api.darksky.net")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude),\(timeString)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        _ = stub(condition: hostStub && pathStub && methodStub && schemeStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", type(of: self))
            return fixture(filePath: forecastJSONPath!, headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
        }
        let client = DarkSkyClient(apiKey: "FAKE-API-KEY")
        client.units = .si
        var forecast: Forecast?
        var metadata: RequestMetadata?
        var err: Error?
        
        // When
        client.getForecast(latitude: latitude, longitude: longitude, time: time) { (result) -> Void in
            switch result {
            case .success(let aForecast, let requestMetadata):
                forecast = aForecast
                metadata = requestMetadata
            case .failure(let error):
                err = error
            }
            expect.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
            XCTAssertNotNil(metadata)
            XCTAssertNil(err)
        })
    }
    
    func testGetForecastWithSIUnits() {
        // Given
        let expect = expectation(description: "Get forecast with SI units")
        let hostStub = isHost("api.darksky.net")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        let queryStub = containsQueryParams(["units": "si"])
        _ = stub(condition: hostStub && pathStub && methodStub && schemeStub && queryStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", type(of: self))
            return fixture(filePath: forecastJSONPath!, headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
        }
        let client = DarkSkyClient(apiKey: "FAKE-API-KEY")
        client.units = .si
        var forecast: Forecast?
        var metadata: RequestMetadata?
        var err: Error?
        
        // When
        client.getForecast(latitude: latitude, longitude: longitude) { (result) -> Void in
            switch result {
            case .success(let aForecast, let requestMetadata):
                forecast = aForecast
                metadata = requestMetadata
            case .failure(let error):
                err = error
            }
            expect.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
            XCTAssertNotNil(metadata)
            XCTAssertNil(err)
        })
    }
    
    func testGetForecastWithFrenchLanguage() {
        // Given
        let expect = expectation(description: "Get forecast with French language")
        let hostStub = isHost("api.darksky.net")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        let queryStub = containsQueryParams(["lang": "fr"])
        _ = stub(condition: hostStub && pathStub && methodStub && schemeStub && queryStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", type(of: self))
            return fixture(filePath: forecastJSONPath!, headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
        }
        let client = DarkSkyClient(apiKey: "FAKE-API-KEY")
        client.language = .french
        var forecast: Forecast?
        var metadata: RequestMetadata?
        var err: Error?
        
        // When
        client.getForecast(latitude: latitude, longitude: longitude) { (result) -> Void in
            switch result {
            case .success(let aForecast, let requestMetadata):
                forecast = aForecast
                metadata = requestMetadata
            case .failure(let error):
                err = error
            }
            expect.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
            XCTAssertNotNil(metadata)
            XCTAssertNil(err)
        })
    }
    
    func testGetForecastWithExtendedHourly() {
        // Given
        let expect = expectation(description: "Get forecast wtih extended hourly")
        let hostStub = isHost("api.darksky.net")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        let queryStub = containsQueryParams(["extend": "hourly"])
        _ = stub(condition: hostStub && pathStub && methodStub && schemeStub && queryStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", type(of: self))
            return fixture(filePath: forecastJSONPath!, headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
        }
        let client = DarkSkyClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var metadata: RequestMetadata?
        var err: Error?
        
        // When
        client.getForecast(latitude: latitude, longitude: longitude, extendHourly: true) { (result) -> Void in
            switch result {
            case .success(let aForecast, let requestMetadata):
                forecast = aForecast
                metadata = requestMetadata
            case .failure(let error):
                err = error
            }
            expect.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
            XCTAssertNotNil(metadata)
            XCTAssertNil(err)
        })
    }
    
    func testGetForecastWithExcludedFields() {
        // Given
        let expect = expectation(description: "Get forecast wtih excluded forecast fields")
        let hostStub = isHost("api.darksky.net")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        let queryStub = containsQueryParams(["exclude": "minutely,daily"])
        _ = stub(condition: hostStub && pathStub && methodStub && schemeStub && queryStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", type(of: self))
            return fixture(filePath: forecastJSONPath!, headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
        }
        let client = DarkSkyClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var metadata: RequestMetadata?
        var err: Error?
        
        // When
        client.getForecast(latitude: latitude, longitude: longitude, excludeFields: [.minutely, .daily]) { (result) -> Void in
            switch result {
            case .success(let aForecast, let requestMetadata):
                forecast = aForecast
                metadata = requestMetadata
            case .failure(let error):
                err = error
            }
            expect.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
            XCTAssertNotNil(metadata)
            XCTAssertNil(err)
        })
    }
    
    func testGetForecastWithoutInternet() {
        // Given
        let expect = expectation(description: "Get forecast without internet")
        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
        _ = stub(condition: isHost("api.darksky.net")) { _ in
            return OHHTTPStubsResponse(error:notConnectedError)
        }
        let client = DarkSkyClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var metadata: RequestMetadata?
        var err: Error?
        
        // When
        client.getForecast(latitude: latitude, longitude: longitude) { (result) -> Void in
            switch result {
            case .success(let aForecast, let requestMetadata):
                forecast = aForecast
                metadata = requestMetadata
            case .failure(let error):
                err = error
            }
            expect.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNil(forecast)
            XCTAssertNil(metadata)
            XCTAssertNotNil(err)
        })
    }
    
    func testGetForecastWithBadJSON() {
        // Given
        let expect = expectation(description: "Get forecast with bad JSON")
        _ = stub(condition: isHost("api.darksky.net")) { _ in
            // Return empty body instead of JSON
            return fixture(filePath: "", headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
        }
        let client = DarkSkyClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var metadata: RequestMetadata?
        var err: Error?
        
        // When
        client.getForecast(latitude: latitude, longitude: longitude) { (result) -> Void in
            switch result {
            case .success(let aForecast, let requestMetadata):
                forecast = aForecast
                metadata = requestMetadata
            case .failure(let error):
                err = error
            }
            expect.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNil(forecast)
            XCTAssertNil(metadata)
            XCTAssertNotNil(err)
        })
    }
    
}

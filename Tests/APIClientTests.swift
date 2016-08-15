//
//  APIClientTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
import OHHTTPStubs
@testable import ForecastIO

class APIClientTests: XCTestCase {
    
    let apiKey = "FAKE-API-KEY"
    let latitude = 41.499320
    let longitude = -81.694361
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    func testInit() {
        //  Given
        //  When
        let client = APIClient(apiKey: apiKey)
        
        //  Then
        XCTAssertNotNil(client)
    }
    
    func testGetForecast() {
        //  Given
        let expect = expectation(description: "Get forecast")
        let hostStub = isHost("api.forecast.io")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        stub(hostStub && pathStub && methodStub && schemeStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: apiKey)
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: latitude, longitude: longitude) { (currentForecast, error) -> Void in
            forecast = currentForecast
            err = error
            if !err {
                expect.fulfill()
            }
        }
        
        //  Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            XCTAssertNotNil(forecast)
        })
    }
    
    func testGetForecastAtTime() {
        //  Given
        let expect = expectation(description: "Get forecast at time")
        let time = Date()
        let timeString = String(format: "%.0f", time.timeIntervalSince1970)
        let hostStub = isHost("api.forecast.io")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude),\(timeString)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        stub(hostStub && pathStub && methodStub && schemeStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        client.units = .SI
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: latitude, longitude: longitude, time: time) { (aForecast, error) -> Void in
            forecast = aForecast
            err = error
            if !err {
                expect.fulfill()
            }
        }
        
        //  Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
        })
    }
    
    func testGetForecastWithSIUnits() {
        //  Given
        let expect = expectation(description: "Get forecast with SI units")
        let hostStub = isHost("api.forecast.io")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        let queryStub = containsQueryParams(["units": "si"])
        stub(hostStub && pathStub && methodStub && schemeStub && queryStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        client.units = .SI
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: latitude, longitude: longitude) { (aForecast, error) -> Void in
            forecast = aForecast
            err = error
            if !err {
                expect.fulfill()
            }
        }
        
        //  Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
        })
    }
    
    func testGetForecastWithFrenchLanguage() {
        //  Given
        let expect = expectation(description: "Get forecast with French language")
        let hostStub = isHost("api.forecast.io")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        let queryStub = containsQueryParams(["lang": "fr"])
        stub(hostStub && pathStub && methodStub && schemeStub && queryStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        client.language = .French
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: latitude, longitude: longitude) { (aForecast, error) -> Void in
            forecast = aForecast
            err = error
            if !err {
                expect.fulfill()
            }
        }
        
        //  Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
        })
    }
    
    func testGetForecastWithExtendedHourly() {
        //  Given
        let expect = expectation(description: "Get forecast wtih extended hourly")
        let hostStub = isHost("api.forecast.io")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        let queryStub = containsQueryParams(["extend": "hourly"])
        stub(hostStub && pathStub && methodStub && schemeStub && queryStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: latitude, longitude: longitude, extendHourly: true) { (aForecast, error) -> Void in
            forecast = aForecast
            err = error
            if !err {
                expect.fulfill()
            }
        }
        
        //  Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
        })
    }
    
    func testGetForecastWithExcludedForecastFields() {
        //  Given
        let expect = expectation(description: "Get forecast wtih excluded forecast fields")
        let hostStub = isHost("api.forecast.io")
        let pathStub = isPath("/forecast/\(apiKey)/\(latitude),\(longitude)")
        let methodStub = isMethodGET()
        let schemeStub = isScheme("https")
        let queryStub = containsQueryParams(["exclude": "minutely,daily"])
        stub(hostStub && pathStub && methodStub && schemeStub && queryStub) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: latitude, longitude: longitude, excludeForecastFields: [.Minutely, .Daily]) { (aForecast, error) -> Void in
            forecast = aForecast
            err = error
            if !err {
                expect.fulfill()
            }
        }
        
        //  Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNotNil(forecast)
        })
    }
    
    func testGetForecastWithoutInternet() {
        //  Given
        let expect = expectation(description: "Get forecast without internet")
        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
        stub(isHost("api.forecast.io")) { _ in
            return OHHTTPStubsResponse(error:notConnectedError)
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: latitude, longitude: longitude) { (aForecast, error) -> Void in
            forecast = aForecast
            err = error
            if err {
                expect.fulfill()
            }
        }
        
        //  Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNil(forecast)
        })
    }
    
    func testGetForecastWithBadJSON() {
        //  Given
        let expect = expectation(description: "Get forecast with bad JSON")
        stub(isHost("api.forecast.io")) { _ in
            //  Return empty body instead of JSON
            return fixture("", headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: latitude, longitude: longitude) { (aForecast, error) -> Void in
            forecast = aForecast
            err = error
            if err {
                expect.fulfill()
            }
        }
        
        //  Then
        waitForExpectations(timeout: 5, handler: { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            XCTAssertNil(forecast)
            XCTAssertNotNil(err)
            XCTAssertEqual(err!.domain, ForecastIOErrorDomain)
            XCTAssertEqual(err!.code, ForecastIOErrorBadJSON)
        })
    }
    
}

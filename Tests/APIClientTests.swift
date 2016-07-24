//
//  APIClientTests.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 1/23/16.
//
//

import XCTest
import Nimble
@testable import ForecastIO
import OHHTTPStubs

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
        expect(client).toNot(beNil())
    }
    
    func testGetForecast() {
        //  Given
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
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
        expect(err).toEventually(beNil())
    }
    
    func testGetForecastAtTime() {
        //  Given
        let time = NSDate()
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
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
        expect(err).toEventually(beNil())
    }
    
    func testGetForecastWithSIUnits() {
        //  Given
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
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
        expect(err).toEventually(beNil())
    }
    
    func testGetForecastWithFrenchLanguage() {
        //  Given
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
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
        expect(err).toEventually(beNil())
    }
    
    func testGetForecastWithExtendedHourly() {
        //  Given
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
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
        expect(err).toEventually(beNil())
    }
    
    func testGetForecastWithExcludedForecastFields() {
        //  Given
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
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
        expect(err).toEventually(beNil())

    }
    
    func testGetForecastWithoutInternet() {
        //  Given
        let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.CFURLErrorNotConnectedToInternet.rawValue), userInfo:nil)
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
        }
        
        //  Then
        expect(forecast).toEventually(beNil())
        expect(err).toEventually(equal(notConnectedError))
    }
    
    func testGetForecastWithBadJSON() {
        //  Given
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
        }
        
        //  Then
        expect(forecast).toEventually(beNil())
        expect(err).toEventuallyNot(beNil())
        expect(err!.domain).toEventually(equal(ForecastIOErrorDomain))
        expect(err!.code).toEventually(equal(ForecastIOErrorBadJSON))
    }
    
}

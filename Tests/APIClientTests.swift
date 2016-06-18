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
import OHHTTPStubs

class APIClientTests: XCTestCase {
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    func testInit() {
        //  Given
        //  When
        let client = APIClient(apiKey: "FAKE-API-KEY")
        
        //  Then
        expect(client).toNot(beNil())
    }
    
    func testGetForecast() {
        //  Given
        stub(isHost("api.forecast.io")) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: 41.499320, longitude: -81.694361) { (currentForecast, error) -> Void in
            forecast = currentForecast
            err = error
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
        expect(err).toEventually(beNil())
    }
    
    func testGetForecastAtTime() {
        //  Given
        stub(isHost("api.forecast.io")) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        client.units = .SI
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: 41.499320, longitude: -81.694361, time: NSDate()) { (aForecast, error) -> Void in
            forecast = aForecast
            err = error
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
        expect(err).toEventually(beNil())
    }
    
    func testGetForecastWithSIUnits() {
        //  Given
        stub(isHost("api.forecast.io")) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: 41.499320, longitude: -81.694361, time: NSDate()) { (aForecast, error) -> Void in
            forecast = aForecast
            err = error
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
        expect(err).toEventually(beNil())
    }
    
    func testGetForecastWithExtendedHourly() {
        //  Given
        stub(isHost("api.forecast.io")) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: 41.499320, longitude: -81.694361, extendHourly: true) { (aForecast, error) -> Void in
            forecast = aForecast
            err = error
        }
        
        //  Then
        expect(forecast).toEventuallyNot(beNil())
        expect(err).toEventually(beNil())
    }
    
    func testGetForecastWithExcludedForecastFields() {
        //  Given
        stub(isHost("api.forecast.io")) { _ in
            let forecastJSONPath = OHPathForFile("forecast.json", self.dynamicType)
            return fixture(forecastJSONPath!, headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: 41.499320, longitude: -81.694361, excludeForecastFields: [.Minutely, .Daily]) { (aForecast, error) -> Void in
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
        client.getForecast(latitude: 41.499320, longitude: -81.694361, time: NSDate()) { (aForecast, error) -> Void in
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
            return fixture("", headers: ["Content-Type": "application/json"])
        }
        let client = APIClient(apiKey: "FAKE-API-KEY")
        var forecast: Forecast?
        var err: NSError?
        
        //  When
        client.getForecast(latitude: 41.499320, longitude: -81.694361, time: NSDate()) { (aForecast, error) -> Void in
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

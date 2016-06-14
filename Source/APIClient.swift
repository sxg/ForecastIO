//
//  APIClient.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/22/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation


/// A class to interact with Forecast.io's Dark Sky API.
public class APIClient : NSObject {
    
    private let apiKey: String
    private let session = NSURLSession.sharedSession()
    private static let forecastIOURL = "https://api.forecast.io/forecast/"
    private var _hourlyExtension = ""
    
    /// Units in which the response will be provided. US is default as per Forecast.io docs.
    public var units = Units.US
    public var extendHourly: Bool = false
    /**
        Creates a new `APIClient` to interact with Forecast.io's Dark Sky API.
     
        - parameter apiKey: Your Dark Sky API key.
     
        - returns: A new `APIClient` configured to interact with Forecast.io's Dark Sky API with your API key.
    */
    public init(apiKey key: String) {
        apiKey = key
    }
    
    /**
        Gets the current `Forecast` at a specified latitude and longitude and returns it in a block.
     
        - parameter latitude:   Latitude at which to get the `Forecast`.
        - parameter longitude:  Longitude at which to get the `Forecast`.
        - parameter completion: A block that returns the `Forecast` at the latitude and longitude you specified or an error.
    */
    public func getForecast(latitude lat: Double, longitude lon: Double, completion: (forecast: Forecast?, error: NSError?) -> Void) {
        let url = NSURL(string: APIClient.forecastIOURL + apiKey + "/\(lat),\(lon)?units=\(units)")!
        getForecast(url, completion: completion)
    }
    
    /**
        Gets the `Forecast` at a specified latitude, longitude, and time, and returns it in a block.
     
        - parameter latitude:   Latitude at which to get the `Forecast`.
        - parameter longitude:  Longitude at which to get the `Forecast`.
        - parameter time:       Time at which to get the `Forecast`. If no timezone is specified, local time (at the specified latitude and longitude) will be assumed.
        - parameter completion: A block that returns the `Forecast` at the latitude and longitude you specified or an error.
    */
    public func getForecast(latitude lat: Double, longitude lon: Double, time: NSDate, completion: (forecast: Forecast?, error: NSError?) -> Void) {
        let timeString = String(format: "%.0f", time.timeIntervalSince1970)
        let url = NSURL(string: APIClient.forecastIOURL + apiKey + "/\(lat),\(lon),\(timeString)?units=\(units)")!
        getForecast(url, completion: completion)
    }
    
    /**
        Gets the `Forecast` at a specified latitude, logitude and excludes blocks as well as the option to extend hourly for 168 hours of data. 
        - parameter latitude:        Latitude at which to get the `Forecast`.
        - parameter longitude:       Longitude at which to get the `Forecast`.
        - parameter excludeBlocks:   Excludes blocks that are not important to the user.
        - parameter extendhourly:    Allows for the extension of hourly to give 168 hours of data.
    */

    public func getForecast(latitude lat: Double, longitude lon: Double, excludeBlocks blocks:[WeatherBlocks], completion: (forecast: Forecast?, error: NSError?) -> Void) {

        if extendHourly {
             _hourlyExtension = "&extend=hourly"
        }
        
        let URLString = APIClient.forecastIOURL + apiKey + "/\(lat),\(lon)?exclude=\(blocks.description)&units=\(units)\(_hourlyExtension)"
        guard let encodedURLString = URLString.stringByAddingPercentEncoding() else {print("Bad encoding"); return}
        guard let url = NSURL(string:encodedURLString) else {print("Bad URL request"); return}
        getForecast(url, completion: completion)
    }
    
    
    private func getForecast(url: NSURL, completion: (forecast: Forecast?, error: NSError?) -> Void) {
        let task = self.session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response, err: NSError?) -> Void in
            if err != nil {
                completion(forecast: nil, error: err)
            } else {
                do {
                    let jsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                    if let json = jsonObject as? NSDictionary {
                        let forecast = Forecast(fromJSON: json)
                        completion(forecast: forecast, error: err)
                    }
                } catch _ {
                    let badJSONErrorUserInfo = [
                        NSLocalizedDescriptionKey : "Failed to read JSON from the Forecast.io API.",
                        NSLocalizedRecoverySuggestionErrorKey : "Make sure the body of a GET request to \(url.absoluteString) returns properly formatted JSON.",
                        NSLocalizedFailureReasonErrorKey : "Could not parse data received from \(url.absoluteString)."
                    ]
                    let badJSONError = NSError(domain: ForecastIOErrorDomain, code: ForecastIOErrorBadJSON, userInfo: badJSONErrorUserInfo)
                    completion(forecast: nil, error: badJSONError)
                }
            }
        })
        task.resume()
    }
}


//Extension that allows for adding Percent Encoding to to allow for the exclusion block to be properly made.
extension String {
    func stringByAddingPercentEncoding() -> String? {
        let unreserved = "/:=&.?,"
        let allowed = NSMutableCharacterSet.alphanumericCharacterSet()
        allowed.addCharactersInString(unreserved)
        return stringByAddingPercentEncodingWithAllowedCharacters(allowed)
    }
}


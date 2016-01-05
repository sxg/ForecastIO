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
    
    /// Units in which the response will be provided. US is default as per Forecast.io docs.
    public var units = Units.US
    
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
    
    private func getForecast(url: NSURL, completion: (forecast: Forecast?, error: NSError?) -> Void) {
        let task = self.session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response, err: NSError?) -> Void in
            if err != nil {
                completion(forecast: nil, error: err)
            } else {
                if let data = data {
                    do {
                        let jsonObject = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
                        if let json = jsonObject as? NSDictionary {
                            let forecast = Forecast(fromJSON: json)
                            completion(forecast: forecast, error: err)
                            return
                        }
                    } catch _ {
                        completion(forecast: nil, error: nil)
                    }
                    
                }
                completion(forecast: nil, error: nil)
            }
        })
        task.resume()
    }
}

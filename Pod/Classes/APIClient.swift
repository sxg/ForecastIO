//
//  APIClient.swift
//  Forecast.io
//
//  Created by Satyam Ghodasara on 7/22/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

public class APIClient : NSObject {
    
    private let apiKey: String
    private let session = NSURLSession.sharedSession()
    private static let forecastIOURL = "https://api.forecast.io/forecast/"
    
    /**
        Creates a new APIClient to interact with Forecast.io's Dark Sky API.
     
        - Parameter apiKey: Your Dark Sky API key.
     
        - Returns: A new APIClient.
    */
    public init(apiKey key: String) {
        apiKey = key
    }
    
    /**
        Gets the current forecast at a specified latitude and longitude and returns it in a block.
     
        - Parameter latitude: Latitude at which to get the forecast.
        - Parameter longitude: Longitude at which to get the forecast.
        - Parameter completion: A block that returns the forecast at the latitude and longitude you specified or an error.
    */
    public func getForecast(latitude lat: Double, longitude lon: Double, completion: (forecast: Forecast?, error: NSError?) -> Void) {
        let url = NSURL(string: APIClient.forecastIOURL + apiKey + "/\(lat),\(lon)")!
        getForecast(url, completion: completion)
    }
    
    /**
        Gets the forecast at a specified latitude, longitude, and time, and returns it in a block.
     
        - Parameter latitude: Latitude at which to get the forecast.
        - Parameter longitude: Longitude at which to get the forecast.
        - Parameter time: Time at which to get the forecast. If no timezone is specified, local time (at the specified latitude and longitude) will be assumed.
        - Parameter completion: A block that returns the forecast at the latitude and longitude you specified or an error.
    */
    public func getForecast(latitude lat: Double, longitude lon: Double, time: NSDate, completion: (forecast: Forecast?, error: NSError?) -> Void) {
        let timeString = String(format: "%.0f", time.timeIntervalSince1970)
        let url = NSURL(string: APIClient.forecastIOURL + apiKey + "/\(lat),\(lon),\(timeString)")!
        getForecast(url, completion: completion)
    }
    
    private func getForecast(url: NSURL, completion: (forecast: Forecast?, error: NSError?) -> Void) {
        let task = self.session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response, err: NSError?) -> Void in
            if err != nil {
                completion(forecast: nil, error: err)
            } else {
                let json = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
                let forecast = Forecast(fromJSON: json)
                completion(forecast: forecast, error: err)
            }
        })
        task.resume()
    }
}

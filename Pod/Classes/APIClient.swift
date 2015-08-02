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
    private let path = "https://api.forecast.io/forecast/"
    
    public init(apiKey key: String) {
        apiKey = key
    }
    
    public func getForecast(latitude lat: Double, longitude lon: Double, completion: (forecast: Forecast!, error: NSError!) -> Void) {
        let url = NSURL(string: "https://api.forecast.io/forecast/" + apiKey + "/\(lat),\(lon)")!
        getForecast(url, completion: completion)
    }
    
    public func getForecast(latitude lat: Double, longitude lon: Double, time: NSDate, completion: (forecast: Forecast!, error: NSError!) -> Void) {
        let timeString = String(format: "%.0f", time.timeIntervalSince1970)
        let url = NSURL(string: "https://api.forecast.io/forecast/" + apiKey + "/\(lat),\(lon),\(timeString)")!
        getForecast(url, completion: completion)
    }
    
    private func getForecast(url: NSURL, completion: (forecast: Forecast!, error: NSError!) -> Void) {
        let task = self.session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response, err: NSError!) -> Void in
            var error: NSError? = nil
            let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
            let forecast = Forecast(fromJSON: json)
            completion(forecast: forecast, error: error)
        })
        task.resume()
    }
}

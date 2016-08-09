//
//  APIClient.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/22/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// A class to interact with the Dark Sky API.
public class APIClient : NSObject {
    
    private let apiKey: String
    private let session = URLSession.shared
    private static let forecastIOURL = "https://api.forecast.io/forecast/"
    
    /// Units in which the `Forecast` response will be provided. US is the default if no units are specified as per the Dark Sky API docs.
    public var units: Units?
    
    /// Language in which the `Forecast` response's `DataBlock` and `DataPoint`'s `summary` properties will be provided. English is the default if no language is specified as per the Dark Sky API docs.
    public var language: Language?
    
    /**
        Creates a new `APIClient` to interact with the Dark Sky API.
     
        - parameter apiKey: Your Dark Sky API key.
     
        - returns: A new `APIClient` configured to interact with the Dark Sky API with your API key.
    */
    public init(apiKey key: String) {
        apiKey = key
    }

    /**
        Gets the current `Forecast` at a specified latitude and longitude and returns it in a block.
     
        - parameter latitude:               Latitude at which to get the `Forecast`.
        - parameter longitude:              Longitude at which to get the `Forecast`.
        - parameter extendHourly:           If `true`, extends the amount of data in the `hourly` property of `Forecast` to 168 hours from 48 hours. Warning: this massively increases the amount of data returned. Defaults to `false`.
        - parameter excludeForecastFields:  `Array` of fields to exclude from the `Forecast` response. Defaults to an empty array.
        - parameter completion:             A block that returns the `Forecast` at the latitude and longitude you specified or an error.
    */
    public func getForecast(latitude lat: Double, longitude lon: Double, extendHourly: Bool = false, excludeForecastFields: [ForecastField] = [], completion: (forecast: Forecast?, error: Error?) -> Void) {
        let url = buildForecastURL(latitude: lat, longitude: lon, time: nil, extendHourly: extendHourly, excludeForecastFields: excludeForecastFields)
        getForecast(url: url, completion: completion)
    }
    
    /**
        Gets the `Forecast` at a specified latitude, longitude, and time, and returns it in a block.
     
        - parameter latitude:               Latitude at which to get the `Forecast`.
        - parameter longitude:              Longitude at which to get the `Forecast`.
        - parameter time:                   Time at which to get the `Forecast`. If no timezone is specified, local time (at the specified latitude and longitude) will be assumed.
        - parameter excludeForecastFields:  `Array` of fields to exclude from the `Forecast` response. Defaults to an empty array.
        - parameter completion:             A block that returns the `Forecast` at the latitude and longitude you specified or an error.
    */
    public func getForecast(latitude lat: Double, longitude lon: Double, time: Date, excludeForecastFields: [ForecastField] = [], completion: (forecast: Forecast?, error: Error?) -> Void) {
        let url = buildForecastURL(latitude: lat, longitude: lon, time: time, extendHourly: false, excludeForecastFields: excludeForecastFields)
        getForecast(url: url, completion: completion)
    }
    
    private func getForecast(url: URL, completion: (forecast: Forecast?, error: Error?) -> Void) {
        let task = self.session.dataTask(with: url, completionHandler: { (data: Data?, response, err: Error?) -> Void in
            if err != nil {
                completion(forecast: nil, error: err)
            } else {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    if let json = jsonObject as? NSDictionary {
                        let forecast = Forecast(fromJSON: json)
                        completion(forecast: forecast, error: err)
                    }
                } catch _ {
                    let badJSONErrorUserInfo = [
                        NSLocalizedDescriptionKey : "Failed to read JSON from the Dark Sky API.",
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
    
    private func buildForecastURL(latitude lat: Double, longitude lon: Double, time: Date?, extendHourly: Bool, excludeForecastFields: [ForecastField]) -> URL {
        //  Build URL path
        var urlString = APIClient.forecastIOURL + apiKey + "/\(lat),\(lon)"
        if let time = time {
            let timeString = String(format: "%.0f", time.timeIntervalSince1970)
            urlString.append(",\(timeString)")
        }
        
        //  Build URL query parameters
        var urlBuilder = URLComponents(string: urlString)!
        var queryItems: [URLQueryItem] = []
        if let units = self.units {
            queryItems.append(URLQueryItem(name: "units", value: units.description))
        }
        if let language = self.language {
            queryItems.append(URLQueryItem(name: "lang", value: language.description))
        }
        if extendHourly {
            queryItems.append(URLQueryItem(name: "extend", value: "hourly"))
        }
        if !excludeForecastFields.isEmpty {
            var excludeForecastFieldsString = ""
            for forecastField in excludeForecastFields {
                if excludeForecastFieldsString != "" {
                    excludeForecastFieldsString.append(",")
                }
                excludeForecastFieldsString.append("\(forecastField.description)")
            }
            queryItems.append(URLQueryItem(name: "exclude", value: excludeForecastFieldsString))
        }
        urlBuilder.queryItems = queryItems
    
        return urlBuilder.url!
    }
}

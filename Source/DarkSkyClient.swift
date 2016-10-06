//
//  DarkSkyClient.swift
//  ForecastIO
//
//  Created by Satyam Ghodasara on 7/22/15.
//  Copyright (c) 2015 Satyam. All rights reserved.
//

import Foundation

/// A class to interact with the Dark Sky API.
open class DarkSkyClient : NSObject {
    
    private let apiKey: String
    private let session = URLSession.shared
    private static let darkSkyURL = "https://api.darksky.net/forecast/"
    
    /// Units in which the `Forecast` response will be provided. US is the default if no units are specified as per the Dark Sky API docs.
    open var units: Units?
    
    /// Language in which the `Forecast` response's `DataBlock` and `DataPoint`'s `summary` properties will be provided. English is the default if no language is specified as per the Dark Sky API docs.
    open var language: Language?
    
    /// Creates a new `DarkSkyClient` to interact with the Dark Sky API.
    ///
    /// - parameter key: Your Dark Sky API key.
    ///
    /// - returns: A new `DarkSkyClient` configured to interact with the Dark Sky API with your API key.
    public init(apiKey key: String) {
        apiKey = key
    }

    /// Gets the current `Forecast` at a specified latitude and longitude and returns it in a block.
    ///
    /// - parameter lat:           Latitude at which to get the `Forecast`.
    /// - parameter lon:           Longitude at which to get the `Forecast`.
    /// - parameter extendHourly:  If `true`, extends the amount of data in the `hourly` property of `Forecast` to 168 hours from 48 hours. Warning: this massively increases the amount of data returned. Defaults to `false`.
    /// - parameter excludeFields: `Array` of fields to exclude from the `Forecast` response. Defaults to an empty array.
    /// - parameter completion:    A block that returns the `Forecast` at the latitude and longitude you specified or an error.
    open func getForecast(latitude lat: Double, longitude lon: Double, extendHourly: Bool = false, excludeFields: [Forecast.Field] = [], completion: @escaping (Result<Forecast>) -> Void) {
        let url = buildForecastURL(latitude: lat, longitude: lon, time: nil, extendHourly: extendHourly, excludeFields: excludeFields)
        getForecast(url: url, completionHandler: completion)
    }
    
    /// Gets the `Forecast` at a specified latitude, longitude, and time, and returns it in a block.
    ///
    /// - parameter lat:           Latitude at which to get the `Forecast`.
    /// - parameter lon:           Longitude at which to get the `Forecast`.
    /// - parameter time:          Time at which to get the `Forecast`. If no timezone is specified, local time (at the specified latitude and longitude) will be assumed.
    /// - parameter excludeFields: `Array` of fields to exclude from the `Forecast` response. Defaults to an empty array.
    /// - parameter completion:    A block that returns the `Forecast` at the latitude and longitude you specified or an error.
    open func getForecast(latitude lat: Double, longitude lon: Double, time: Date, excludeFields: [Forecast.Field] = [], completion: @escaping (Result<Forecast>) -> Void) {
        let url = buildForecastURL(latitude: lat, longitude: lon, time: time, extendHourly: false, excludeFields: excludeFields)
        getForecast(url: url, completionHandler: completion)
    }
    
    private func getForecast(url: URL, completionHandler: @escaping (Result<Forecast>) -> Void) {
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("gzip", forHTTPHeaderField: "Accept-Encoding")
        let task = self.session.dataTask(with: urlRequest, completionHandler: { (data: Data?, response, err: Error?) -> Void in
            if let err = err {
                completionHandler(Result.failure(err))
            } else {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    if let json = jsonObject as? NSDictionary, let httpURLResponse = response as? HTTPURLResponse {
                        let forecast = Forecast(fromJSON: json)
                        let requestMetadata = RequestMetadata(fromHTTPHeaderFields: httpURLResponse.allHeaderFields)
                        completionHandler(Result.success(forecast, requestMetadata))
                    }
                } catch _ {
                    let invalidJSONError = ForecastIOError.invalidJSON(data!)
                    completionHandler(Result.failure(invalidJSONError))
                }
            }
        })
        task.resume()
    }
    
    private func buildForecastURL(latitude lat: Double, longitude lon: Double, time: Date?, extendHourly: Bool, excludeFields: [Forecast.Field]) -> URL {
        //  Build URL path
        var urlString = DarkSkyClient.darkSkyURL + apiKey + "/\(lat),\(lon)"
        if let time = time {
            let timeString = String(format: "%.0f", time.timeIntervalSince1970)
            urlString.append(",\(timeString)")
        }
        
        //  Build URL query parameters
        var urlBuilder = URLComponents(string: urlString)!
        var queryItems: [URLQueryItem] = []
        if let units = self.units {
            queryItems.append(URLQueryItem(name: "units", value: units.rawValue))
        }
        if let language = self.language {
            queryItems.append(URLQueryItem(name: "lang", value: language.rawValue))
        }
        if extendHourly {
            queryItems.append(URLQueryItem(name: "extend", value: "hourly"))
        }
        if !excludeFields.isEmpty {
            var excludeFieldsString = ""
            for field in excludeFields {
                if excludeFieldsString != "" {
                    excludeFieldsString.append(",")
                }
                excludeFieldsString.append("\(field.rawValue)")
            }
            queryItems.append(URLQueryItem(name: "exclude", value: excludeFieldsString))
        }
        urlBuilder.queryItems = queryItems
    
        return urlBuilder.url!
    }
}

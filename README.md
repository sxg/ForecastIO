# ForecastIO

[![CI Status](http://img.shields.io/travis/Satyam Ghodasara/ForecastIO.svg?style=flat)](https://travis-ci.org/Satyam Ghodasara/ForecastIO)
[![Version](https://img.shields.io/cocoapods/v/ForecastIO.svg?style=flat)](http://cocoapods.org/pods/ForecastIO)
[![License](https://img.shields.io/cocoapods/l/ForecastIO.svg?style=flat)](http://cocoapods.org/pods/ForecastIO)
[![Platform](https://img.shields.io/cocoapods/p/ForecastIO.svg?style=flat)](http://cocoapods.org/pods/ForecastIO)

## Requirements

To use ForecastIO, all you need is an API key for the [Dark Sky API](https://developer.forecast.io/).

## Installation

ForecastIO is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ForecastIO"
```

## Documentation

The full documentation for ForecastIO is available on [CocoaDocs](http://cocoadocs.org/docsets/ForecastIO).

## Usage

First, create an `APIClient` with your API key.

```swift
import ForecastIO
...
let forecastIOClient = APIClient(apiKey: "YOUR_API_KEY_HERE")
```

With the `APIClient`, you can make two kinds of requests. The first will get the current `Forecast` for a particular location:

```swift
forecastIOClient.getForecast(latitude: myLat, longitude: myLon) { (currentForecast, error) -> Void in
  if let currentForecast = currentForecast {
    //  We got the current forecast!
  } else if let error = error {
    //  Uh-oh we have an error!
  }
}
```

The second kind of request will get a `Forecast` for a particular location at a particular time:

```swift
forecastIOClient.getForecast(latitude: myLat, longitude: myLon, time: myTime) { (forecast, error) -> Void in
  if let forecast = forecast {
    //  We got the forecast!
  } else if let error = error {
    //  Uh-oh we have an error!
  }
}
```

## Author

Satyam Ghodasara, sghodas@gmail.com

## License

ForecastIO is available under the MIT license. See the LICENSE file for more info.

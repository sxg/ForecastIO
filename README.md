# ForecastIO

[![CI Status](http://img.shields.io/travis/sxg/ForecastIO.svg?style=flat)](https://travis-ci.org/sxg/ForecastIO)
[![Documentation](https://img.shields.io/cocoapods/metrics/doc-percent/ForecastIO.svg)](http://cocoadocs.org/docsets/ForecastIO/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/ForecastIO.svg?style=flat)](http://cocoapods.org/pods/ForecastIO)
[![License](https://img.shields.io/cocoapods/l/ForecastIO.svg?style=flat)](http://cocoapods.org/pods/ForecastIO)
[![Platform](https://img.shields.io/cocoapods/p/ForecastIO.svg?style=flat)](http://cocoapods.org/pods/ForecastIO)

## Requirements

To use ForecastIO, all you need is an API key for the [Dark Sky API](https://developer.forecast.io/). ForecastIO supports iOS (≥8.0), macOS (≥10.10), watchOS (≥2.0), and tvOS (≥9.0).

## Installation

ForecastIO is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your `Podfile`:

```ruby
pod "ForecastIO"
```

To integrate using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Cartfile`:

```ogdl
github "sxg/ForecastIO"
```

### Swift 3

A pre-release version of ForecastIO with Swift 3 compatibility is available on the [swift3](https://github.com/sxg/ForecastIO/tree/swift3) branch. To install it, simply add the following line to your `Podfile`:

```ruby
pod "ForecastIO", :git => "https://github.com/sxg/ForecastIO.git", :branch => "swift3"
```

To integrate the Swift 3 compatible version using Carthage, specify it in your `Cartfile`:

```ogdl
github "sxg/ForecastIO" "swift3"
```

## Documentation & Unit Tests

The full documentation for ForecastIO is available on [CocoaDocs](http://cocoadocs.org/docsets/ForecastIO).

ForecastIO includes a full suite of unit tests with [100% code coverage](https://codecov.io/gh/sxg/ForecastIO).

## Usage

First, create an `APIClient` with your API key:

```swift
import ForecastIO
...
let forecastIOClient = APIClient(apiKey: "YOUR_API_KEY_HERE")
```

You can choose units that you want `Forecast` responses to use:

```swift
forecastIOClient.units = .SI
```

The following units are supported:
- SI
- US (default)
- Canadian
- UK
- Auto (uses the local units for the location for which you are requesting weather data)

You can also choose the language that you want `Forecast` responses to use:

```swift
forecastIOClient.language = .English
```

Many languages are supported (a full list is available [here](https://developer.forecast.io/docs/v2#options)). If no language is specified, English is used as the default.

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

The second kind of request is called a time machine request, and it will get a `Forecast` for a particular location at a particular time:

```swift
forecastIOClient.getForecast(latitude: myLat, longitude: myLon, time: myTime) { (forecast, error) -> Void in
  if let forecast = forecast {
    //  We got the forecast!
  } else if let error = error {
    //  Uh-oh we have an error!
  }
}
```

The `Forecast` you receive will have metadata as well as `DataPoint`s and `DataBlock`s associated with it. A `DataPoint` such as the `currently` property on `Forecast` represents various weather phenomena occurring at a specific instant in time. A `DataBlock` such as the `minutely`, `hourly`, and `daily` properties on `Forecast` represent the various weather phenomena occurring over a period of time and are represented by an array of `DataPoint`s.

`DataPoint`s and `DataBlock`s contain a large amount of information, and any of these fields can be excluded from the API response through the `excludeForecastFields` parameter of the `getForecast` methods. `excludeForecastFields` is optional and defaults to an empty array, meaning no data will be excluded from the API response. Alternatively, if you need more data, you can set the `extendHourly` parameter of the `getForecast` method to `true` to make the `hourly` property on `Forecast`
return hourly data for a full week instead of 24 hours. `extendHourly` is an optional parameter and defaults to `false`. `extendHourly` is not supported on time machine requests.

For a full list of properties defined on all models, consult the [full documentation on CocoaDocs](http://cocoadocs.org/docsets/ForecastIO).

## Author

Satyam Ghodasara, sghodas@gmail.com

## License

ForecastIO is available under the MIT license. See the `LICENSE` file for more info.

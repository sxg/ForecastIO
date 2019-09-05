![ForecastIO](header.png)

![Swift](https://img.shields.io/badge/Swift-5.0-brightgreen.svg)
[![CI Status](http://img.shields.io/travis/sxg/ForecastIO.svg?style=flat)](https://travis-ci.org/sxg/ForecastIO)
[![Documentation](https://img.shields.io/cocoapods/metrics/doc-percent/ForecastIO.svg)](http://cocoadocs.org/docsets/ForecastIO/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/ForecastIO.svg?style=flat)](http://cocoapods.org/pods/ForecastIO)
[![License](https://img.shields.io/cocoapods/l/ForecastIO.svg?style=flat)](http://cocoapods.org/pods/ForecastIO)
[![Platform](https://img.shields.io/cocoapods/p/ForecastIO.svg?style=flat)](http://cocoapods.org/pods/ForecastIO)

## Requirements

To use ForecastIO, all you need is an API key for the [Dark Sky API](https://darksky.net/dev/). ForecastIO supports iOS (≥9.0), macOS (≥10.10), watchOS (≥2.0), and tvOS (≥9.0).

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

### Swift 2.3

A Swift 2.3 compatible version of ForecastIO is available on the [swift2.3](https://github.com/sxg/ForecastIO/tree/swift2.3) branch. This version is frozen at the [ForecastIO 2.1.1 API](http://cocoadocs.org/docsets/ForecastIO/2.1.1/) and no longer supported. To install the Swift 2.3 compatible version of ForecastIO, simply add the following line to your `Podfile`:

```ruby
pod "ForecastIO", :git => "https://github.com/sxg/ForecastIO.git", :branch => "swift2.3"
```

To integrate the Swift 2.3 compatible version using Carthage, specify it in your `Cartfile`:

```ogdl
github "sxg/ForecastIO" "swift2.3"
```

## Documentation & Unit Tests

The full documentation for ForecastIO is available on [CocoaDocs](http://cocoadocs.org/docsets/ForecastIO).

ForecastIO includes a full suite of unit tests with 100% code coverage.

## Usage

First, create a `DarkSkyClient` with your API key:

```swift
import ForecastIO
...
let client = DarkSkyClient(apiKey: "YOUR_API_KEY_HERE")
```

You can choose units that you want `Forecast` responses to use:

```swift
client.units = .si
```

The following units are supported:
- SI
- US (default)
- Canadian
- UK
- Auto (uses the local units for the location for which you are requesting weather data)

More details about the units of each property are available [in the Dark Sky API docs](https://darksky.net/dev/docs/forecast).

You can also choose the language that you want `Forecast` responses to use:

```swift
client.language = .english
```

Many languages are supported (a full list is available [here](https://darksky.net/dev/docs/forecast)). If no language is specified, English is used as the default.

With the `DarkSkyClient`, you can make two kinds of requests. The first will get the current `Forecast` for a particular location:

```swift
let myLoc = CLLocationCoordinate2D(latitude: myLat, longitude: myLon)
client.getForecast(location: myLoc) { result in
    switch result {
    case .success(let currentForecast, let requestMetadata):
        // We got the current forecast!
    case .failure(let error):
        // Uh-oh. We have an error!
    }
}
```

The second kind of request is called a time machine request, and it will get a `Forecast` for a particular location at a particular time:

```swift
let myLoc = CLLocationCoordinate2D(latitude: myLat, longitude: myLon)
client.getForecast(location: myLoc, time: myTime) { result in
    switch result {
    case .success(let forecast, let requestMetadata):
        // We got the forecast!
    case .failure(let error):
        // Uh-oh. We have an error!
    }
}
```

The `Forecast` you receive will have metadata as well as `DataPoint`s and `DataBlock`s associated with it. A `DataPoint` such as the `currently` property on `Forecast` represents various weather phenomena occurring at a specific instant in time. A `DataBlock` such as the `minutely`, `hourly`, and `daily` properties on `Forecast` represent the various weather phenomena occurring over a period of time and are represented by an array of `DataPoint`s.

`DataPoint`s and `DataBlock`s contain a large amount of information, and any of these fields can be excluded from the API response through the `excludeFields` parameter of the `getForecast` methods. `excludeFields` is optional and defaults to an empty array, meaning no data will be excluded from the API response. Alternatively, if you need more data, you can set the `extendHourly` parameter of the `getForecast` method to `true` to make the `hourly` property on `Forecast` return hourly data for a full week instead of 24 hours. `extendHourly` is an optional parameter and defaults to `false`. `extendHourly` is not supported on time machine requests.

For a full list of properties defined on all models, consult the [full documentation on CocoaDocs](http://cocoadocs.org/docsets/ForecastIO).

## Author

Satyam Ghodasara, sghodas@gmail.com, [@\_Satyam\_](https://twitter.com/_satyam_)

## License

ForecastIO is available under the MIT license. See the `LICENSE` file for more info.

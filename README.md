# ForecastIO

## Requirements

ForecastIO requires iOS 8.0 or later.

## Installation

ForecastIO is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ForecastIO"
```

## Usage

To use ForecastIO, first initialize the APIClient:

```swift
import ForecastIO
...
let forecastClient = APIClient(apiKey: YOUR_API_KEY)
```

The ForecastIO API client only has two public methods, so it's simple and easy to use. The first method gets the current forecast for a given latitude and longitude:

```swift
forecastClient.getForecast(latitude: myLat, longitude: myLon) { (currentForecast, error) -> Void in
    if err != nil {
        //  Uh-oh! We have an error!
    } else {
        //  Do something with the currentForecast
    }
}
```

The second method gets the forecast at a given time (past, present, or future) for a given latitude and longitude:

```swift
forecastClient.getForecast(latitude: myLat, longitude: myLon, time: myTime) { (forecast, error) -> Void in
    if err != nil {
        //  Uh-oh! We have an error!
    } else {
        //  Do something with the forecast
    }
}
```

ForecastIO supports all models described by the [Dark Sky API](https://developer.forecast.io/docs/v2). This includes forecasts, data blocks, data points, alerts, and flags. For more details on the implementations of the models' properties, check the files located in [ForecastIO/Pod/Classes](https://github.com/sghodas/ForecastIO/tree/master/Pod/Classes).

## Author

Satyam Ghodasara, sghodas@gmail.com

## License

ForecastIO is available under the MIT license. See the LICENSE file for more info.

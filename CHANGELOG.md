# Change Log

ForecastIO adheres to [Semantic Versioning](http://semver.org/).

## 2.1.0

Released on July 24, 2016.

### Added
- Support for multiple languages
- More unit tests for enums
- More platforms for unit testing on Travis CI
- CocoaDocs and Carthage badges to `README.md`

### Updated
- Unit tests are stricter in checking for a valid URL
- Unit tests now use `@testable` to import ForecastIO
- Details on the optional parameters `extendHourly` and `excludeForecastFields` in `README.md`

## 2.0.0

Released on June 18, 2016.

### Added
- Exclusion of fields from `getForecast` (by [miwand](https://github.com/miwand))
- Extension of `hourly` property to include up to 168 hours of data (by [miwand](https://github.com/miwand))
- `ForecastField` to represent `DataPoint`s and `DataBlock`s on `Forecast` responses (by [miwand](https://github.com/miwand))

### Removed
- Support for OS X 10.9 - deployment target for OS X is now 10.10

### Updated
- Description of `DataPoint`s and `DataBlock`s in `README.md`
- Example project uses `excludeForecastFields` parameter

## 1.6.1

Released on May 12, 2016.

#### Updated
- Fixed issue where the project's interval version number wasn't updated
- Carthage installation section in `README.md`
- Unit test section in `README.md`

## 1.6.0

Released on May 4, 2016.

#### Added
- `ForecastIOErrorDomain` error domain
- `ForecastIOErrorBadJSON` error type

#### Updated
- `APIClient` methods provide more detailed errors
- Unit tests have 100% code coverage
- Travis CI unit tests run on latest versions of iOS, watchOS, and tvOS
- CocoaPod dependencies for unit tests
- Lowered the example project's deployment target to iOS 8.0

## 1.5.0

Released on Jan 24, 2016.

#### Added
- This `CHANGELOG.md` file
- `Package.swift` manifest file for Swift Package Manager
- List of supported units in `README.md`
- Description of `Forecast`'s `DataPoint`s and `DataBlock`s in `README.md`
- Unit tests
- [Travis CI](https://travis-ci.org/sxg/ForecastIO)

#### Updated
- Restructured project hierarchy for Swift Package Manager
- `Units.Auto` enum variant is now capitalized in consistency with Swift style guides

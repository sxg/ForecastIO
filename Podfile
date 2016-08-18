source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

def testing_pods
    pod "ForecastIO", :path => "./"
    pod "OHHTTPStubs"
    pod "OHHTTPStubs/Swift"
end

target 'ForecastIO iOS Tests' do
    platform :ios, '8.0'
    testing_pods
end

target 'ForecastIO tvOS Tests' do
    platform :tvos, '9.0'
    testing_pods
end

target 'ForecastIO macOS Tests' do
    platform :osx, '10.10'
    testing_pods
end

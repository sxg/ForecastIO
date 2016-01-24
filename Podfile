source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

def testing_pods
    pod "ForecastIO", :path => "./"
    pod "Nimble", "~> 3.1"
    pod "OHHTTPStubs", "~> 4.7"
    pod "OHHTTPStubs/Swift", "~> 4.7"
end

target 'ForecastIO iOS Tests' do
    platform :ios, '8.0'
    testing_pods
end

target 'ForecastIO tvOS Tests' do
    platform :tvos, '9.0'
    testing_pods
end

target 'ForecastIO OSX Tests' do
    platform :osx, '10.9'
    testing_pods
end

#
# Be sure to run `pod lib lint ForecastIO.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ForecastIO"
  s.version          = "0.2.0"
  s.summary          = "A short description of ForecastIO."
  s.description      = <<-DESC
                       An optional longer description of ForecastIO

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/sghodas/ForecastIO"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Satyam Ghodasara" => "sghodas@gmail.com" }
  s.source           = { :git => "https://github.com/sghodas/ForecastIO.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/_Satyam_'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ForecastIO' => ['Pod/Assets/*.png']
  }
end

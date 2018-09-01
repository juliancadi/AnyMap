plugin 'cocoapods-keys', {
  :project => "AnyMap",
  :keys => [
  "gmsServicesAPIKey"
  ]}

platform :ios, '9.0'
use_frameworks!

def swift
  
  # Swift Style Guide
  pod 'SwiftLint'
  
  # Maps
  pod 'Mapbox-iOS-SDK' # Mapbox
  pod 'GoogleMaps' # GoogleMaps
  
  # Reactive Swift
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxSwiftExt'
  pod 'RxCoreLocation'
  
end

def objectiveC
  
end

target 'AnyMap' do
  
  swift
  objectiveC
  
  target 'AnyMapTests' do
    inherit! :search_paths
  end
  
  target 'AnyMapUITests' do
    inherit! :search_paths
  end
  
end

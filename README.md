AnyMap 🗺
==================================

Little example, *still in development*, using different map/satellite imagery SDKs just because it makes a lot of fun 🤓

## Map frameworks 🌎

- Mapbox
- MapKit
- GoogleMaps

## Third-party libraries 📚

**Swift**

- SwiftLint
- RxSwift
- Mapbox-iOS-SDK
- GoogleMaps

**Objective-C**

- N/A

## Components ⚒️

- **AnyMap:** Source classes and assets
- **AnyMapTests:** Unit testing
- **AnyMapUITests:** UI & Integration testing

## Architecture 👷

- Model-View-ViewModel (MVVM) mixed with Composite Pattern.
- RxSwift as Observer mechanism.
- OS Compatibility: iOS 9+
- Xcode Version: 9.4.1
- Swift Version: 4.1

## Usage 👨‍🔧

1. Install [cocoapods-keys](https://github.com/orta/cocoapods-keys)
2. Provide an [API key](https://developers.google.com/maps/documentation/embed/get-api-key) for Google Maps iOS SDK
3. Provide an [access token](https://www.mapbox.com/account/access-tokens/) for Mapbox iOS SDK into *mapboxToken* file
4. Open AnyMap.xcworkspace
5. Run tests (Cmd + U)
6. Run project (Cmd + R)
7. Have fun!

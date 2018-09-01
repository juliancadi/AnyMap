//
//  LocationViewModel.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import CoreLocation
import RxSwift
import RxCocoa
import RxCoreLocation
import RxSwiftExt

private var defaultLocation = CLLocation(latitude: 52.5145277, longitude: 13.3499998)
private var defaultZoom: Double = 17.0

struct LocationViewModel {
  
}

extension LocationViewModel: ViewModelType {
  
  struct Input {
    let changeLocationTrigger: Observable<CLLocation?>
    let changeAuthorizationTrigger: Driver<CLAuthorizationEvent>
    let stopUpdateLocationTrigger: Driver<CLLocationsEvent>
  }
  
  struct Output {
    let loading: Driver<Bool>
    let locationChanged: Driver<CoordinateRegion>
    let updateLocationStopped: Driver<Void>
    let errors: Driver<Error>
  }
  
  func transform(input: Input) -> Output {
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    let loading = activityIndicator.asDriver()
    let errors = errorTracker.asDriver()
    
    let locationMapping: (CLLocation) -> CoordinateRegion = {
      CoordinateRegion(center: $0.coordinate, zoom: defaultZoom)
    }
    
    let userLocationChanged = input.changeLocationTrigger
      .unwrap()
      .map(locationMapping)
      .asDriverOnErrorJustComplete()
    
    let unknownLocation = input.changeLocationTrigger
      .filter { $0 == nil }
      .mapToVoid()
      .asDriverOnErrorJustComplete()
    let userDidNotAuthorizeLocation = input.changeAuthorizationTrigger
      .filter { $0.status != .authorizedWhenInUse && $0.status != .authorizedAlways }
      .mapToVoid()
    let showDefaultLocation = Driver.merge(unknownLocation, userDidNotAuthorizeLocation)
      .map { defaultLocation }
      .map(locationMapping)
      .asDriver()
    
    let locationChanged = Driver.merge(userLocationChanged, showDefaultLocation)
    
    let updateLocationStopped = input.stopUpdateLocationTrigger
      .mapToVoid()
      .asDriver()
    
    return Output(loading: loading,
                  locationChanged: locationChanged,
                  updateLocationStopped: updateLocationStopped,
                  errors: errors)
  }
  
}

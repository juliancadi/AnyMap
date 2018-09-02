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
  
  let input: Input
  var output: Output!
  
  init(input: Input) {
    self.input = input
    self.output = transform()
  }
  
  private let disposeBag = DisposeBag()
  let lastKnownLocation = BehaviorRelay<CoordinateRegion>(value: CoordinateRegion(center: defaultLocation.coordinate,
                                                                                  zoom: defaultZoom))
  
}

extension LocationViewModel: ViewModelType {
  
  struct Input {
    let changeLocationTrigger: Driver<CLLocation>
    let stopUpdateLocationTrigger: Driver<CLLocationsEvent>
  }
  
  struct Output {
    let updateLocationStopped: Driver<Void>
  }
  
  internal func transform() -> Output {
    
    let locationMapping: (CLLocation) -> CoordinateRegion = {
      CoordinateRegion(center: $0.coordinate, zoom: defaultZoom)
    }
    
    input.changeLocationTrigger
      .map(locationMapping)
      .drive(lastKnownLocation)
      .disposed(by: disposeBag)
    
    let updateLocationStopped = input.stopUpdateLocationTrigger
      .mapToVoid()
      .asDriver()
    
    return Output(updateLocationStopped: updateLocationStopped)
  }
  
}

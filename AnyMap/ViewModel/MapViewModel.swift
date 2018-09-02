//
//  MapViewModel.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftExt

struct MapViewModel {
  
  let input: Input
  var output: Output!
  
  init(input: Input) {
    self.input = input
    self.output = transform()
  }
  
}

extension MapViewModel: ViewModelType {
  
  struct Input {
    let actualRegion: CoordinateRegion
    let changeRegionTrigger: Driver<CoordinateRegion>
  }
  
  struct Output {
    let loading: Driver<Bool>
    let initialRegion: Driver<CoordinateRegion>
    let region: Driver<CoordinateRegion>
    let errors: Driver<Error>
  }
  
  internal func transform() -> Output {
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    let loading = activityIndicator.asDriver()
    let errors = errorTracker.asDriver()
    
    let initialRegion = Driver.just(input.actualRegion)
    
    let region = input.changeRegionTrigger

    return Output(loading: loading,
                  initialRegion: initialRegion,
                  region: region,
                  errors: errors)
  }
  
}

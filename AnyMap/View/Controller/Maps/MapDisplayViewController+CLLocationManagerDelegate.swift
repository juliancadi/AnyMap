//
//  MapDisplayViewController+CLLocationManagerDelegate.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import CoreLocation
import RxSwift
import RxCocoa

extension MapDisplayViewController: CLLocationManagerDelegate {
  
  /// Set up location manager to know user location.
  internal func setUpLocationManager() {
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.requestAlwaysAuthorization()
      locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
      locationManager.startUpdatingLocation()
    }
  }
  
  internal func bindViewModel() {
    let userLocationChanged = self.locationManager.rx.location
    let userAuthorizationChanged = self.locationManager.rx.didChangeAuthorization.asDriverOnErrorJustComplete()
    let updatingLocationStopped = self.locationManager.rx.didUpdateLocations.asDriverOnErrorJustComplete()
    let input = LocationViewModel.Input(changeLocationTrigger: userLocationChanged,
                                        changeAuthorizationTrigger: userAuthorizationChanged,
                                        stopUpdateLocationTrigger: updatingLocationStopped)
    
    let output = viewModel.transform(input: input)
    
    output.locationChanged
      .debug()
      .drive(self.mapable.region)
      .disposed(by: disposeBag)
    
    output.updateLocationStopped
      .drive(onNext: { [weak self] in
        self?.locationManager.stopUpdatingLocation()
      })
      .disposed(by: disposeBag)
  }

}

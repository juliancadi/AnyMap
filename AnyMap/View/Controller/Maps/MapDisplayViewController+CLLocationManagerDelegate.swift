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
  
}

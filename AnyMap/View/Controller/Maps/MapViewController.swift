//
//  MapViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, Mapable {
  
  func showCurrentLocation() {
    // TODO: showCurrentLocation
  }
  
}

protocol Mapable {
  
  func showCurrentLocation()
  
}

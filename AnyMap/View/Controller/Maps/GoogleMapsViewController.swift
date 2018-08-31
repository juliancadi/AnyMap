//
//  GoogleMapsViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import GoogleMaps

class GoogleMapsViewController: MapViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view = GMSMapView()
  }

}

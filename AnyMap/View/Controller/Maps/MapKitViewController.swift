//
//  MapKitViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import MapKit

class MapKitViewController: MapViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view = MKMapView()
  }

}

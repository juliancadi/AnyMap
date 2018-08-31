//
//  MapboxMapViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import Mapbox

class MapboxMapViewController: MapViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let mapView = MGLMapView()
    mapView.styleURL = URL(string: "mapbox://styles/mapbox/streets-v10")
    view = mapView
  }
  
}

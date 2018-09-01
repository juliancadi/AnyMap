//
//  MapboxMapViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import Mapbox
import RxSwift
import RxCocoa

class MapboxMapViewController: UIViewController {

  private lazy var mapView = MGLMapView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupMapView()
  }
  
}

private extension MapboxMapViewController {
  
  func setupMapView() {
    mapView.styleURL = URL(string: "mapbox://styles/mapbox/streets-v10")
    mapView.showsUserLocation = true
    view = mapView
  }
  
}

extension MapboxMapViewController: Mapable {
  
  var region: Binder<CoordinateRegion> {
    return mapView.rx.regionBinder
  }
  
}

//
//  GoogleMapsViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import GoogleMaps
import RxSwift
import RxCocoa

class GoogleMapsViewController: UIViewController {

  private lazy var mapView = GMSMapView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupMapView()
  }

}

private extension GoogleMapsViewController {
  
  func setupMapView() {
    mapView = GMSMapView()
    mapView.isMyLocationEnabled = true
    view = mapView
  }
  
}

extension GoogleMapsViewController: Mapable {
  
  var region: Binder<CoordinateRegion> {
    return mapView.rx.regionBinder
  }
  
}

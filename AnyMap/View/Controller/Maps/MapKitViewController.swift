//
//  MapKitViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import MapKit
import RxSwift
import RxCocoa
import RxMKMapView

class MapKitViewController: UIViewController {
  
  private lazy var mapView = MKMapView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupMapView()
  }
  
}

private extension MapKitViewController {
  
  func setupMapView() {
    mapView = MKMapView()
    mapView.showsUserLocation = true
    mapView.isRotateEnabled = false
    mapView.isPitchEnabled = false
    view = mapView
  }
  
}

extension MapKitViewController: Mapable {
  
  var region: Binder<CoordinateRegion> {
    return mapView.rx.regionBinder
  }
  
  var regionDidChange: Observable<CoordinateRegion> {
    return mapView.rx.regionDidChange
  }
  
}

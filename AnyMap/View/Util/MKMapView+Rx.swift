//
//  MKMapView+Rx.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import MapKit
import RxSwift
import RxCocoa

extension Reactive where Base: MKMapView {
  
  /// Binder for visible region on map view.
  var regionBinder: Binder<CoordinateRegion> {
    return Binder(self.base) { mapView, region in
      mapView.setRegion(region.mapKit, animated: false)
    }
  }
  
  var regionDidChange: Observable<CoordinateRegion> {
    return regionDidChangeAnimated
      .map { [base] _ in base.coordinateRegion }
  }
  
}

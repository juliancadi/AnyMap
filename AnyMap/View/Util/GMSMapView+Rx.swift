//
//  GMSMapView+Rx.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import GoogleMaps
import RxSwift
import RxCocoa
import RxGoogleMaps

extension Reactive where Base: GMSMapView {
  
  /// Binder for visible region on map view.
  var regionBinder: Binder<CoordinateRegion> {
    return Binder(self.base) { mapView, region in
      mapView.camera = region.googleMaps
    }
  }

  var regionDidChange: Observable<CoordinateRegion> {
    return didChange
      .map { [base] _ in base.coordinateRegion }
  }
  
}

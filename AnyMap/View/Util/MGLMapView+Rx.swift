//
//  MGLMapView+Rx.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import Mapbox
import RxSwift
import RxCocoa

extension Reactive where Base: MGLMapView {
  
  /// Binder for visible region on map view.
  var regionBinder: Binder<CoordinateRegion> {
    return Binder(self.base) { mapView, region in
      mapView.setCenter(region.mapbox.0, zoomLevel: region.mapbox.1, animated: region.mapbox.2)
    }
  }
  
}

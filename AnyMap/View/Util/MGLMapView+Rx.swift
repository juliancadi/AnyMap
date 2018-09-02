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
  
  public var delegate: DelegateProxy<MGLMapView, MGLMapViewDelegate> {
    return RxMGLMapViewDelegateProxy.proxy(for: base)
  }
  
  /// Binder for visible region on map view.
  var regionBinder: Binder<CoordinateRegion> {
    return Binder(self.base) { mapView, region in
      mapView.setCenter(region.mapbox.0, zoomLevel: region.mapbox.1, animated: region.mapbox.2)
    }
  }
  
  var regionDidChange: Observable<CoordinateRegion> {
    return delegate.methodInvoked(#selector(MGLMapViewDelegate.mapView(_:regionDidChangeAnimated:)))
      .map {
        let mapView = $0[0] as! Base
        return (mapView.coordinateRegion)
    }
  }
  
}

extension MGLMapView: HasDelegate {
  public typealias Delegate = MGLMapViewDelegate
}

public class RxMGLMapViewDelegateProxy: DelegateProxy<MGLMapView, MGLMapViewDelegate>, DelegateProxyType, MGLMapViewDelegate {
  
  public weak private(set) var mapView: MGLMapView?
  
  public init(mapView: MGLMapView) {
    self.mapView = mapView
    super.init(parentObject: mapView, delegateProxy: RxMGLMapViewDelegateProxy.self)
  }
  
  public static func registerKnownImplementations() {
    register(make: RxMGLMapViewDelegateProxy.init)
  }
  
}

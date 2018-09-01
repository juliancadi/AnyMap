//
//  MKMapView+Coordinates.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import MapKit

/// Get bounds coordinates from visible map region.
extension MKMapView {
  
  var southWestCoordinates: CLLocationCoordinate2D {
    let mapPoint = MKMapPoint(x: visibleMapRect.origin.x, y: MKMapRectGetMaxY(visibleMapRect))
    return MKCoordinateForMapPoint(mapPoint)
  }
  
  var northEastCoordinates: CLLocationCoordinate2D {
    let mapPoint = MKMapPoint(x: MKMapRectGetMaxX(visibleMapRect), y: visibleMapRect.origin.y)
    return MKCoordinateForMapPoint(mapPoint)
  }
  
}

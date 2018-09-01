//
//  CoordinateRegion+MapView.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import MapKit
import GoogleMaps

private let mapboxZoomFactor: Double = 1.0625
private let mapKitZoomFactor: Double = 4250
private let googleMapsZoomFactor: Double = 1.0

extension CoordinateRegion {

  /** Use mapboxZoomFactor to get MapBox zoom level.
   At zoom level 0, each tile covers the entire world map;
   at zoom level 1, it covers ¼ of the world;
   at zoom level 2, 1⁄16 of the world, and so on.
   */
  var mapbox: (CLLocationCoordinate2D, Double, Bool) {
    return (self.center, self.zoom / mapboxZoomFactor, false)
  }
  
  /** Use mapKitZoomFactor to get Apple's MapKit zoom level.
   Latitude Delta is the amount of north-to-south distance (measured in degrees) to display on the map.
   Longitude Delta is the amount of east-to-west distance (measured in degrees) to display for the map region.
   */
  var mapKit: MKCoordinateRegion {
    return MKCoordinateRegion(center: self.center,
                              span: MKCoordinateSpan(latitudeDelta: self.zoom / mapKitZoomFactor,
                                                     longitudeDelta: self.zoom / mapKitZoomFactor))
  }
  
  /** Use googleMapsZoomFactor to get GoogleMaps zoom level.
   Uses an exponentional scale, where zoom 0 represents the entire world as a 256 x 256 square.
   Each successive zoom level increases magnification by a factor of 2.
   So at zoom level 1, the world is 512x512, and at zoom level 2, the entire world is 1024x1024.
   */
  var googleMaps: GMSCameraPosition {
    return GMSCameraPosition.camera(withTarget: self.center, zoom: Float(self.zoom * googleMapsZoomFactor))
  }

}

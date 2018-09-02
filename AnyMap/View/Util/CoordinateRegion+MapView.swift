//
//  CoordinateRegion+MapView.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import Mapbox
import MapKit
import GoogleMaps

// TODO: Enable rotation & pitch
// TODO: Unit test for scales and factors
private let mapboxZoomFactor: Double = 1.0625
private let mapKitDistanceFactor: Double = 4250
private let googleMapsZoomFactor: Double = 1.0

extension CoordinateRegion {

  /** Use mapboxZoomFactor to get MapBox zoom level.
   At zoom level 0, each tile covers the entire world map;
   at zoom level 1, it covers ¼ of the world;
   at zoom level 2, 1⁄16 of the world, and so on.
   */
  var mapbox: (CLLocationCoordinate2D, Double, Bool) {
    return (self.center, (self.zoom / mapboxZoomFactor), false)
  }
  
  /** Use mapKitZoomFactor to get Apple's MapKit zoom level.
   Latitude Delta is the amount of north-to-south distance (measured in degrees) to display on the map.
   Longitude Delta is the amount of east-to-west distance (measured in degrees) to display for the map region.
   */
  var mapKit: MKCoordinateRegion {
    return MKCoordinateRegionMakeWithDistance(self.center, mapKitDistanceFactor / self.zoom,
                                                           mapKitDistanceFactor / self.zoom)
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

extension MGLMapView {
  
  var coordinateRegion: CoordinateRegion {
    return CoordinateRegion(center: self.centerCoordinate, zoom: self.zoomLevel * mapboxZoomFactor)
  }
  
}

extension MKMapView {
  
  var coordinateRegion: CoordinateRegion {
    return CoordinateRegion(center: self.centerCoordinate, zoom: self.zoom)
  }
  
  public var zoom: Double {
    // Returns current zoom of the map
    var angleCamera: Double = 0
    if angleCamera > 270 {
      angleCamera = 360 - angleCamera
    } else if angleCamera > 90 {
      angleCamera = fabs(angleCamera - 180)
    }
    let angleRad = Double.pi * angleCamera / 180 // map rotation in radians
    let width = Double(self.frame.size.width)
    let height = Double(self.frame.size.height)
    // The offset (status bar height) which is taken by MapKit into consideration to calculate visible area height
    let heightOffset: Double = 20
    // Calculating Longitude span corresponding to normal (non-rotated) width
    let spanStraight = width * self.region.span.longitudeDelta / (width * cos(angleRad) + (height - heightOffset) * sin(angleRad))
    return log2(360 * ((width / 128) / spanStraight))
  }
  
}

extension GMSMapView {
  
  var coordinateRegion: CoordinateRegion {
    return CoordinateRegion(center: self.camera.target, zoom: Double(self.camera.zoom) * googleMapsZoomFactor)
  }
  
}

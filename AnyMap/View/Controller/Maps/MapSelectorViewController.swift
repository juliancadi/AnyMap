//
//  MapSelectorViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

class MapSelectorViewController: UIViewController {
  
  // MARK: - IBOutlets

  @IBOutlet weak var mapTypeSegmentedControl: UISegmentedControl!
  @IBOutlet weak var mapContainer: UIView!
  
  // MARK: - State
  
  private lazy var stateViewController = ContentStateViewController()
  private var mapDisplayViewController: MapDisplayViewController!
  
  // MARK: - UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Rounded corners
    mapTypeSegmentedControl.layer.cornerRadius = 4.0
    
    add(viewController: stateViewController, to: mapContainer)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let intialMapable = mapable(for: MapType(rawValue: mapTypeSegmentedControl.selectedSegmentIndex)!)
    mapDisplayViewController = MapDisplayViewController(mapable: intialMapable)
    render(viewController: mapDisplayViewController)
  }
  
  @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
    let newMapable = mapable(for: MapType(rawValue: sender.selectedSegmentIndex)!)
    mapDisplayViewController.transition(to: newMapable)
  }
  
}

private extension MapSelectorViewController {
  
  func render(viewController: MapDisplayViewController) {
    stateViewController.transition(to: .render(viewController))
  }
  
  func mapable(for type: MapType) -> Mapable {
    switch type {
    case .mapbox:
      return MapboxMapViewController()
    case .mapKit:
      return MapKitViewController()
    case .googleMaps:
      return GoogleMapsViewController()
    }
  }
  
}

extension MapSelectorViewController {
  enum MapType: Int {
    case mapbox
    case mapKit
    case googleMaps
  }
}

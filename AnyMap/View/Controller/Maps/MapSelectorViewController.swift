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
  
  // MARK: - UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    add(viewController: stateViewController, to: mapContainer)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    render(viewController: mapDisplayViewController(for: MapType(rawValue: mapTypeSegmentedControl.selectedSegmentIndex)!))
  }
  
  @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
    render(viewController: mapDisplayViewController(for: MapType(rawValue: sender.selectedSegmentIndex)!))
  }
  
}

private extension MapSelectorViewController {
  
  func render(viewController: MapDisplayViewController) {
    stateViewController.transition(to: .render(viewController))
  }
  
  func mapDisplayViewController(for type: MapType) -> MapDisplayViewController {
    switch type {
    case .mapbox:
      return MapDisplayViewController(mapable: MapboxMapViewController())
    case .mapKit:
      return MapDisplayViewController(mapable: MapKitViewController())
    case .googleMaps:
      return MapDisplayViewController(mapable: GoogleMapsViewController())
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

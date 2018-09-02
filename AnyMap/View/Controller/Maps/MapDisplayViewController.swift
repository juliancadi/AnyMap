//
//  MapDisplayViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit
import CoreLocation
import RxCocoa
import RxSwift

class MapDisplayViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var mapDisplayView: UIView!
  internal let locationManager = CLLocationManager()
  
  // MARK: - ViewModel
  
  private var locationViewModel: LocationViewModel!
  private var mapViewModel: MapViewModel!
  
  private let disposeBag = DisposeBag()
  private var mapableBag: DisposeBag?
  
  // MARK: - Initialization
  
  private var mapable: Mapable
  
  init(mapable: Mapable) {
    self.mapable = mapable
    super.init(nibName: "MapDisplayViewController", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Wrong implementation. Mapable left.")
  }
  
  // MARK: - UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpLocationManager()
    bindLocationViewModel()
    transition(to: self.mapable)
  }
  
}

extension MapDisplayViewController {
  
  func transition(to mapable: Mapable) {
    mapableBag = nil
    (self.mapable as! UIViewController).remove()
    add(viewController: mapable as! UIViewController, to: mapDisplayView)
    self.mapable = mapable
    bindMapViewModel()
  }
  
}

private extension MapDisplayViewController {
  
  func bindLocationViewModel() {
    let userLocationChanged = self.locationManager.rx.location.unwrap().asDriverOnErrorJustComplete()
    let updatingLocationStopped = self.locationManager.rx.didUpdateLocations.asDriverOnErrorJustComplete()
    let input = LocationViewModel.Input(changeLocationTrigger: userLocationChanged,
                                        stopUpdateLocationTrigger: updatingLocationStopped)
    locationViewModel = LocationViewModel(input: input)
    
    locationViewModel.output.updateLocationStopped
      .drive(onNext: { [weak self] in
        self?.locationManager.stopUpdatingLocation()
      })
      .disposed(by: disposeBag)
  }
  
  func bindMapViewModel() {
    mapableBag = DisposeBag()
    let input = MapViewModel.Input(actualRegion: locationViewModel.lastKnownLocation.value,
                                   changeRegionTrigger: mapable.regionDidChange.asDriverOnErrorJustComplete())
    
    mapViewModel = MapViewModel(input: input)
    
    mapViewModel.output.initialRegion
      .drive(self.mapable.region)
      .disposed(by: mapableBag!)
    
    mapViewModel.output.region
      .drive(locationViewModel.lastKnownLocation)
      .disposed(by: mapableBag!)
  }
  
}

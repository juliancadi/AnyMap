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
  
  // MARK: - Initialization
  
  internal let mapable: Mapable
  internal let viewModel = LocationViewModel()
  internal let locationManager = CLLocationManager()
  internal let disposeBag = DisposeBag()
  
  init(mapable: Mapable) {
    self.mapable = mapable
    super.init(nibName: "MapDisplayViewController", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Wrong implementation. ViewModel state left.")
  }
  
  // MARK: - UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    add(viewController: mapable as! UIViewController, to: mapDisplayView)
    
    setUpLocationManager()
    bindViewModel()
  }

}

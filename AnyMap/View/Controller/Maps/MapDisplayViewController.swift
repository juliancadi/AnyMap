//
//  MapDisplayViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

class MapDisplayViewController: UIViewController {
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var mapDisplayView: UIView!
  
  // MARK: - Initialization
  
  private let mapViewController: MapViewController
  
  init(controller: MapViewController) {
    self.mapViewController = controller
    super.init(nibName: "MapDisplayViewController", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Wrong implementation. ViewModel state left.")
  }
  
  // MARK: - UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    add(viewController: mapViewController, to: mapDisplayView)
  }

}

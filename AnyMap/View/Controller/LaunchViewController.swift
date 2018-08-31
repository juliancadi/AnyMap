//
//  LaunchViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    show(MainViewController(), sender: nil)
  }

}

//
//  MainViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
  }
  
}

private extension MainViewController {
  
  func setupUI() {
    configureTabBar()
    let mapsVC = MapSelectorViewController()
    mapsVC.tabBarItem = UITabBarItem(title: "Maps", image: #imageLiteral(resourceName: "MapsBarButton"), selectedImage: #imageLiteral(resourceName: "MapsBarButton"))
    let activityVC = ActivityViewController()
    activityVC.tabBarItem = UITabBarItem(title: "Activity", image: #imageLiteral(resourceName: "ActivityBarButton"), selectedImage: #imageLiteral(resourceName: "ActivityBarButton"))
    viewControllers = [mapsVC, activityVC]
  }
  
}

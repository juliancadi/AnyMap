//
//  UITabBarController+Default.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

extension UITabBarController {
  
  func configureTabBar() {
    tabBar.isTranslucent = false
    tabBar.barTintColor = .greenRYB
    tabBar.tintColor = .isabelline
    if #available(iOS 10.0, *) {
      tabBar.unselectedItemTintColor = .oliveDrab
    } else {
      UITabBar.appearance().tintColor = .oliveDrab
    }
  }

}

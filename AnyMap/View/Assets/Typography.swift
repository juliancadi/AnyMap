//
//  Typography.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

extension UIFont {
  
  class var header: UIFont {
    return UIFont.systemFont(ofSize: 36.0, weight: .bold)
  }
  
  class var title: UIFont {
    return UIFont.systemFont(ofSize: 24.0, weight: .bold)
  }
  
  class var subtitle: UIFont {
    return UIFont.systemFont(ofSize: 20.0, weight: .semibold)
  }
  
  class var content: UIFont {
    return UIFont.systemFont(ofSize: 16.0, weight: .regular)
  }
  
  class var background: UIFont {
    return UIFont.systemFont(ofSize: 16.0, weight: .light)
  }
  
}

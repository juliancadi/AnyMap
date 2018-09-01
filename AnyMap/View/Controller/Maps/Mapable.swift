//
//  Mapable.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import RxCocoa

protocol Mapable {
  
  var region: Binder<CoordinateRegion> { get }
  
}

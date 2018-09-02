//
//  Mapable.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import RxCocoa
import RxSwift

protocol Mapable {
  
  var region: Binder<CoordinateRegion> { get }
  var regionDidChange: Observable<CoordinateRegion> { get }
  
}

//
//  ViewModelType.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import Foundation

protocol ViewModelType {
  
  associatedtype Input
  associatedtype Output
  
  func transform(input: Input) -> Output
  
}

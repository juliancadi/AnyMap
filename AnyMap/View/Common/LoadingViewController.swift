//
//  LoadingViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
  
  private lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(activityIndicator)
    
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
      ])
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    activityIndicator.startAnimating()
  }
  
}

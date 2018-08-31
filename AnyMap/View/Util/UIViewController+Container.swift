//
//  UIViewController+Container.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func add(viewController: UIViewController, to view: UIView? = nil) {
    let containerView: UIView = view == nil ? self.view : view!
    addChildViewController(viewController)
    containerView.addSubview(viewController.view)
    viewController.didMove(toParentViewController: self)
    viewController.clipTo(parent: containerView)
  }
  
  private func clipTo(parent: UIView) {
    self.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0),
      self.view.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 0),
      self.view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0),
      self.view.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0)
      ])
  }
  
  func remove() {
    guard parent != nil else {
      return
    }
    self.willMove(toParentViewController: nil)
    self.view.removeFromSuperview()
    self.removeFromParentViewController()
  }
  
}

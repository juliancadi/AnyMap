//
//  ContentStateViewController.swift
//  AnyMap
//
//  Created by Julian Caicedo on 30.08.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import UIKit

class ContentStateViewController: UIViewController {
  
  // MARK: - UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if state == nil {
      transition(to: .loading)
    }
  }
  
  // MARK: - Transitions / States
  
  private var state: State?
  private var shownViewController: UIViewController?
  
  func transition(to newState: State) {
    shownViewController?.remove()
    let cvc = viewController(for: newState)
    add(viewController: cvc)
    shownViewController = cvc
    state = newState
  }
  
}

extension ContentStateViewController {
  enum State {
    case loading
    case failed(Error)
    case render(UIViewController)
  }
}

private extension ContentStateViewController {
  func viewController(for state: State) -> UIViewController {
    switch state {
    case .loading:
      return LoadingViewController()
    case .failed(let error):
      // TODO: Error managments
      print(error .localizedDescription)
      return UIViewController()
    case .render(let viewController):
      return viewController
    }
  }
}

//
//  ActivityIndicator.swift
//  AnyMap
//
//  Created by Julian Caicedo on 01.09.18.
//  Copyright © 2018 juliancadi.com. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public class ActivityIndicator: SharedSequenceConvertibleType {
  // swiftlint:disable type_name
  public typealias E = Bool
  // swiftlint:enable type_name
  public typealias SharingStrategy = DriverSharingStrategy
  
  private let _lock = NSRecursiveLock()
  private let _variable = BehaviorRelay<Bool>(value: false)
  private let _loading: SharedSequence<SharingStrategy, Bool>
  
  public init() {
    _loading = _variable.asDriver()
      .distinctUntilChanged()
  }
  
  fileprivate func trackActivityOfObservable<O: ObservableConvertibleType>(_ source: O) -> Observable<O.E> {
    return source.asObservable()
      .do(onNext: { _ in
        self.sendStopLoading()
      }, onError: { _ in
        self.sendStopLoading()
      }, onCompleted: {
        self.sendStopLoading()
      }, onSubscribe: subscribed)
  }
  
  private func subscribed() {
    _lock.lock()
    _variable.accept(true)
    _lock.unlock()
  }
  
  private func sendStopLoading() {
    _lock.lock()
    _variable.accept(false)
    _lock.unlock()
  }
  
  public func asSharedSequence() -> SharedSequence<SharingStrategy, E> {
    return _loading
  }
}

extension ObservableConvertibleType {
  public func trackActivity(_ activityIndicator: ActivityIndicator) -> Observable<E> {
    return activityIndicator.trackActivityOfObservable(self)
  }
}

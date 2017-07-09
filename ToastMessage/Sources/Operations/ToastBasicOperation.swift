//
//  ToastOperation.swift
//  Toaster
//
//  Created by Sergey Shatunov on 7/3/17.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import UIKit
import Foundation
class ToastBasicOperation: Operation {

    override init() {
        super.init()
        self.qualityOfService = QualityOfService.userInteractive
        self.name = "ToastOperation"
    }

    var isStarted: Bool {
        return self.state == .executing && self.state == .finished
    }
    // MARK: - Types

    enum State {
        case ready, executing, finished

        func keyPath() -> String {
            switch self {
            case .ready:
                return "isReady"
            case .executing:
                return "isExecuting"
            case .finished:
                return "isFinished"
            }
        }
    }

    // MARK: - Properties

    var state = State.ready {
        willSet {
            willChangeValue(forKey: newValue.keyPath())
            willChangeValue(forKey: state.keyPath())
        }
        didSet {
            didChangeValue(forKey: oldValue.keyPath())
            didChangeValue(forKey: state.keyPath())
        }
    }

    // MARK: - NSOperation

    override open var isReady: Bool {
        return super.isReady && state == .ready
    }

    override open var isExecuting: Bool {
        return state == .executing
    }

    override open var isFinished: Bool {
        return state == .finished
    }

    override open var isAsynchronous: Bool {
        return true
    }

    override open func cancel() {
        super.cancel()
    }

}

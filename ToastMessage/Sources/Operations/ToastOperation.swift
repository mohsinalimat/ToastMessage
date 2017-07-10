//
//  ToastOperation.swift
//  Toaster
//
//  Created by Sergey Shatunov on 7/3/17.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import UIKit

final class ToastOperation: ToastBasicOperation, ToastViewDelegate {

    private let msg: ToastMessage
    private let location: ToastViewLocation
    private let presenter: ToastPresenter
    private let fabric: ToastStyleFabric
    private let window: UIWindow
    private var timer: Timer?
    private var currentView: UIView?
    private let style: ToastViewStyle
    required init(window: UIWindow, msg: ToastMessage,
                  location: ToastViewLocation, fabric: ToastStyleFabric, style: ToastViewStyle) {
        self.msg = msg
        self.location = location
        self.presenter = fabric.presenter()
        self.fabric = fabric
        self.window = window
        self.style = style
        super.init()
    }

    override func start() {
        if isCancelled {
            self.state = .finished
            return
        }

        self.state = .executing
        main()
    }

    override func main() {
        if isCancelled == true || self.state == .finished {
            return
        }

        timer = Timer.scheduledTimer(timeInterval: msg.duration, target: self,
                                     selector: #selector(ToastOperation.timerTick), userInfo: nil, repeats: false)
        let toastView = fabric.view(delegate: self, message: msg, style: style)

        presenter.present(target: toastView, with: location, to: window, completed: {})
        currentView = toastView
    }

    func timerTick() {
        hideView()
    }

    func hideView() {
        if let toastView = currentView {
            self.currentView = nil
            presenter.removeFromHierarchy(target: toastView) { [weak self] in
                self?.state = .finished
            }
        }
    }

    func toastAskedToBeClosed(view: ToastView) {
        hideView()
    }

    override func cancel() {
        super.cancel()
        hideView()
    }

}

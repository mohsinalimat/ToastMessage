//
//  ToastNotificationPresenter.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/4/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit

final class ToastNotiticationPresenter: ToastPresenter {

    private var yConstraint: NSLayoutConstraint!
    func present(target: UIView, with location: ToastViewLocation,
                 to window: UIWindow, completed: @escaping () -> Void) {
        window.addSubview(target)
        window.bringSubview(toFront: target)

        setupLocation(for: target, in: window)
        animateView(target: target, in: window, completed: completed)
    }

    func removeFromHierarchy(target: UIView, removed: @escaping () -> Void) {

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.55, initialSpringVelocity: 5.5,
                       options: [], animations: { [weak self] in
            if let yConstraint = self?.yConstraint {
                 yConstraint.constant = -target.bounds.size.height
            }
            target.superview?.layoutIfNeeded()
            }, completion: { (_) in
                target.removeFromSuperview()
                removed()
        })

    }

    private func setupLocation(for target: UIView, in window: UIWindow) {
        let viewsDict: [String : Any] = ["item": target]

        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[item]-(0)-|",
                                                                   options: [], metrics: nil, views: viewsDict)

        let xCConstraint = NSLayoutConstraint(item: target, attribute: .centerX, relatedBy: .equal,
                                              toItem: window, attribute: .centerX, multiplier: 1, constant: 0)
        yConstraint = NSLayoutConstraint(item: target, attribute: .top, relatedBy: .equal, toItem: window,
                                         attribute: .top, multiplier: 1, constant: 0)

        NSLayoutConstraint.activate([yConstraint, xCConstraint] + horizontalConstraints)
        target.layoutIfNeeded()
        window.layoutIfNeeded()
    }

    private func animateView(target: UIView, in window: UIWindow, completed: @escaping () -> Void) {

        self.yConstraint.constant = -100
        window.layoutIfNeeded()

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.55, initialSpringVelocity: 5.5,
                       options: [], animations: { [weak self] in
            self?.yConstraint.constant = 0
            window.layoutIfNeeded()
        }, completion: { (_) in
            completed()
        })
    }
}

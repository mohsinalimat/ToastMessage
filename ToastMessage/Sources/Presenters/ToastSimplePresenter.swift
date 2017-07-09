//
//  ToastSimplePresenter.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/4/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit

final class ToastSimplePresenter: ToastPresenter {

    func present(target: UIView, with location: ToastViewLocation,
                 to window: UIWindow, completed: @escaping () -> Void) {
        window.addSubview(target)
        window.bringSubview(toFront: target)

        setupLocation(location: location, for: target)
        animateView(target: target, completed: completed)
    }

    func removeFromHierarchy(target: UIView, removed: @escaping () -> Void) {

        UIView.animate(withDuration: 0.3, animations: {
            target.alpha = 0.0
        }) { (_) in
            target.removeFromSuperview()
            removed()
        }
    }

    private func setupLocation(location: ToastViewLocation, for target: UIView) {

        let viewsDict: [String : Any] = ["item": target]

        switch location {
        case .bottomSpace(let margin):
            let metrics: [String : Any] = [ "marginPoints": NSNumber(value: margin)]
            let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[item]-|", options: [],
                                                                       metrics: nil, views: viewsDict)
            let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[item]-(marginPoints)-|",
                                                                     options: [], metrics: metrics, views: viewsDict)
            NSLayoutConstraint.activate(verticalConstraints + horizontalConstraints)
        case .topSpace(let margin):
            let metrics: [String : Any] = [ "marginPoints": NSNumber(value: margin)]
            let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[item]-|", options: [],
                                                                       metrics: nil, views: viewsDict)
            let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(marginPoints)-[item]",
                                                                     options: [], metrics: metrics, views: viewsDict)
            NSLayoutConstraint.activate(verticalConstraints + horizontalConstraints)
        }

    }

    private func animateView(target: UIView, completed: @escaping () -> Void) {
        target.alpha = 0.0
        UIView.animate(withDuration: 0.3, animations: {
            target.alpha = 1.0
        }) { (_) in
            completed()
        }
    }
}

//
//  ToastNotificationView.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/4/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit

/**
 Notification-Like Toast View.
 Always on top. Contains title.
*/
final class ToastNotificationView: UIView, ToastView {

    public weak var toastDelegate: ToastViewDelegate?
    private let backView: UIView
    private let title: UILabel

    private let horizontalPadding: Float = 20.0
    private let verticalPadding: Float = 23.0

    required init?(coder aDecoder: NSCoder) {
        fatalError("ToastManagerView should not be called directly")
    }

    // swiftlint:disable function_body_length
    required init(toastDelegate: ToastViewDelegate) {
        self.toastDelegate = toastDelegate
        backView = UIView(frame: CGRect.zero)
        title = UILabel(frame: CGRect.zero)
        super.init(frame: CGRect.zero)

        self.translatesAutoresizingMaskIntoConstraints = false

        do {
            backgroundColor = UIColor.clear
            backView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(backView)

            let viewsDict: [String : Any] = ["item": backView]
            let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[item]-(0)-|",
                                                                       options: [],
                                                                       metrics: nil,
                                                                       views: viewsDict)

            let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[item]-|",
                                                                     options: [],
                                                                     metrics: nil,
                                                                     views: viewsDict)
            let xConstraint = NSLayoutConstraint(item: backView, attribute: .centerX, relatedBy: .equal,
                                                 toItem: self, attribute: .centerX, multiplier: 1, constant: 0)

            NSLayoutConstraint.activate(verticalConstraints + horizontalConstraints + [xConstraint])
        }

        do {
            title.textColor = UIColor.white
            title.minimumScaleFactor = 0.6
            title.adjustsFontSizeToFitWidth = true
            title.numberOfLines = 0
            title.textAlignment = .center
            title.translatesAutoresizingMaskIntoConstraints = false

            backView.addSubview(title)

            let metrics: [String : Any] = [ "marginPointsH": NSNumber(value: horizontalPadding),
                                            "marginPointsV": NSNumber(value: verticalPadding)]
            let viewsDict: [String : Any] = ["item": title]
            let horizontalConstraints = NSLayoutConstraint.constraints(
                                    withVisualFormat: "H:|-(marginPointsH)-[item]-(marginPointsH)-|",
                                                                       options: [],
                                                                       metrics: metrics,
                                                                       views: viewsDict)
            let verticalConstraints = NSLayoutConstraint.constraints(
                                    withVisualFormat: "V:|-(marginPointsV)-[item]-(marginPointsV)-|",
                                                                     options: [],
                                                                     metrics: metrics,
                                                                     views: viewsDict)

            NSLayoutConstraint.activate(verticalConstraints + horizontalConstraints)
        }

        let buttonClose: UIButton
        do {
            buttonClose = UIButton(type: .custom)
            buttonClose.frame = backView.bounds
            buttonClose.addTarget(self, action: #selector(ToastSimpleView.closeClicked), for: .touchUpInside)
            buttonClose.translatesAutoresizingMaskIntoConstraints = false
            backView.addSubview(buttonClose)

            let viewsDict: [String : Any] = ["item": buttonClose]
            let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[item]-(0)-|",
                                                                       options: [],
                                                                       metrics: nil,
                                                                       views: viewsDict)
            let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[item]-(0)-|",
                                                                     options: [],
                                                                     metrics: nil,
                                                                     views: viewsDict)
            NSLayoutConstraint.activate(verticalConstraints + horizontalConstraints)
        }
    }

    func fill(msg: ToastMessage, style: ToastViewStyle) {
        backView.backgroundColor = style.backgroundColor
        title.text = msg.msg
        title.textColor = style.textColor
        title.font = style.font
    }

    func closeClicked() {
        self.toastDelegate?.toastAskedToBeClosed(view: self)
    }

}

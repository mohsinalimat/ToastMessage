//
//  ToastsViewController.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/8/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit
import ToastMessage

class ToastsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Toasts"
    }

    @IBAction func topToastClicked(_ sender: Any) {
        ToastManager.shared.showToastMessage(msg: "Top Message")
    }

    @IBAction func bottomToastClicked(_ sender: Any) {
        ToastManager.shared.showToastMessage(msg: "Bottom Message with long long long long long long long long title",
                                             duration: 3.0,
                                             location: ToastViewLocation.bottomSpace(margin: 80))
    }

    @IBAction func customToastClicked(_ sender: Any) {
        ToastManager.shared.showToastMessage(msg: "Custom Message", duration: 2.0,
                                             location: ToastViewLocation.default, style: ToastCustomStyle())
    }

    struct ToastCustomStyle: ToastViewStyle {
        public var backgroundColor: UIColor = UIColor.yellow
        public var textColor: UIColor = UIColor.black
        public var font: UIFont = UIFont.boldSystemFont(ofSize: 22)

        init() {}
    }
}

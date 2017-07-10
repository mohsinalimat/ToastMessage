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
        ToastManager.shared.showToast(message: "Top Message")
    }

    @IBAction func bottomToastClicked(_ sender: Any) {
        ToastManager.shared.showToast(message: "Bottom Message with long long long long long long long long title",
                                             duration: 3.0,
                                             location: ToastViewLocation.bottomSpace(margin: 80))
    }

    @IBAction func customToastClicked(_ sender: Any) {
        ToastManager.shared.showToast(message: "Long two-lines custom message two-lines custom message",
                                      duration: 2.0,
                                      location: ToastViewLocation.top, style: ToastCustomStyle())
    }

    struct ToastCustomStyle: ToastViewStyle {
        let backgroundColor: UIColor = UIColor(red: (251/255), green: (225/255), blue: (26/255), alpha: (1.0))
        let textColor: UIColor = UIColor(red: (71/255), green: (64/255), blue: (0/255), alpha: (1.0))
        let font: UIFont = (UIFont(name: "HelveticaNeue-Thin", size: 13) ?? UIFont.systemFont(ofSize: 14))
    }
}

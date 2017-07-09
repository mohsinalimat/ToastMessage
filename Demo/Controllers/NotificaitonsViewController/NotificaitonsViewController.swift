//
//  NotificaitonsViewController.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/8/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit
import ToastMessage

class NotificaitonsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notitications"
    }

    @IBAction func topNotificationClicked(_ sender: Any) {
         ToastManager.shared.showNotificationMessage(msg: "Top Message")
    }

    @IBAction func customNotificationClicked(_ sender: Any) {
        ToastManager.shared.showNotificationMessage(msg: "Custom Message",
                                                    duration: 2.0, style: NotificationCustomStyle())
    }

    struct NotificationCustomStyle: ToastViewStyle {
        public var backgroundColor: UIColor = UIColor.orange
        public var textColor: UIColor = UIColor.black
        public var font: UIFont = UIFont.systemFont(ofSize: 16.0)

        init() {}
    }

}

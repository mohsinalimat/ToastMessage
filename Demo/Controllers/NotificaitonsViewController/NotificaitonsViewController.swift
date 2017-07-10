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
         ToastManager.shared.showNotification(message: "Top Message")
    }

    @IBAction func customNotificationClicked(_ sender: Any) {
        ToastManager.shared.showNotification(message: "Custom Message",
                                                    duration: 2.0, style: NotificationCustomStyle())
    }

    @IBAction func cancelclicked(_ sender: Any) {
        ToastManager.shared.cancelAll()
    }

    struct NotificationCustomStyle: ToastViewStyle {
        let backgroundColor: UIColor = UIColor.orange
        let textColor: UIColor = UIColor.black
        let font: UIFont = UIFont.systemFont(ofSize: 16.0)
    }

}

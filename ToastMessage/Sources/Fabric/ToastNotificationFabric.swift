//
//  ToastNotificationFabric.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/4/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit

final class ToastNotificationFabric: ToastStyleFabric {
    func presenter() -> ToastPresenter {
        return ToastNotiticationPresenter()
    }

    func view(delegate: ToastViewDelegate, message: ToastMessage, style: ToastViewStyle) -> UIView {
        let view = ToastNotificationView(toastDelegate: delegate)
        view.fill(msg: message, style: style)
        return view
    }
}

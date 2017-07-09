//
//  ToastSimpleFabric.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/4/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit

final class ToastSimpleFabric: ToastStyleFabric {
    func presenter() -> ToastPresenter {
        return ToastSimplePresenter()
    }

    func view(delegate: ToastViewDelegate, message: ToastMessage, style: ToastViewStyle) -> UIView {
        let view = ToastSimpleView(toastDelegate: delegate)
        view.fill(msg: message, style: style)
        return view
    }
}

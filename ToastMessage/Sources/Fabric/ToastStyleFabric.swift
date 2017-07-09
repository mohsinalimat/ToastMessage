//
//  ToastStyleFabric.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/4/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit

protocol ToastStyleFabric {
    func presenter() -> ToastPresenter
    func view(delegate: ToastViewDelegate, message: ToastMessage, style: ToastViewStyle) -> UIView
}

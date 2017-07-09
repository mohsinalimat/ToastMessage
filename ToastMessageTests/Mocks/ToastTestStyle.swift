//
//  ToastTestStyle.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/8/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit
@testable import ToastMessage

struct ToastTestStyle: ToastViewStyle {
    public var backgroundColor: UIColor = UIColor.yellow
    public var textColor: UIColor = UIColor.green
    public var font: UIFont = UIFont.boldSystemFont(ofSize: 22)

    init() {}
}

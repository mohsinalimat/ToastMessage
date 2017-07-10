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
    let  backgroundColor: UIColor = UIColor.yellow
    let textColor: UIColor = UIColor.green
    let font: UIFont = UIFont.boldSystemFont(ofSize: 22)
}

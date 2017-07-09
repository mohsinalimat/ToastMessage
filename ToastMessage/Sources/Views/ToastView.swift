//
//  ToastManagerView.swift

import UIKit

/**
 Protocol for Toast Views.
*/
protocol ToastView: class {
    var toastDelegate: ToastViewDelegate? {get}
    func fill(msg: ToastMessage, style: ToastViewStyle)
}

/**
 Protocol for Toast Views Delegates.
*/
protocol ToastViewDelegate: class {
    func toastAskedToBeClosed(view: ToastView)
}

//

import Foundation
import UIKit

/**
 Toast Manager. Responsible for presenting and queueing the messages.
 */
final public class ToastManager {

    /**
     Toast manager shared instance.
     */
    static public let shared = ToastManager()

    /**
     Show simple toast.
     
     - parameter msg: String - title of the toast
     - parameter duration: TimeInterval - duration of the toast. Default is 1.5s
     - parameter location: ToastViewLocation - location of the toast
     */
    public func showToastMessage(msg: String, duration: TimeInterval = 1.5,
                                 location: ToastViewLocation = ToastViewLocation.default,
                                 style: ToastViewStyle = ToastDefaultStyle()) {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.keyWindow {
                let message = ToastMessage(msg: msg, duration: duration)
                let operation = ToastOperation(window: window, msg: message,
                                               location: location, fabric: ToastSimpleFabric(), style: style)
                OperationQueue.main.addOperation(operation)
            }
        }
    }

    /**
     Show notitication-like toast. Always on top.
     
     - parameter msg: String - title of the toast
     - parameter duration: TimeInterval - duration of the toast. Default is 1.5s
     */
    public func showNotificationMessage(msg: String, duration: TimeInterval = 1.5,
                                        style: ToastViewStyle = ToastDefaultStyle()) {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.keyWindow {
                let message = ToastMessage(msg: msg, duration: duration)
                let operation = ToastOperation(window: window, msg: message,
                                               location: ToastViewLocation.top,
                                               fabric: ToastNotificationFabric(), style: style)
                OperationQueue.main.addOperation(operation)
            }
        }
    }
}

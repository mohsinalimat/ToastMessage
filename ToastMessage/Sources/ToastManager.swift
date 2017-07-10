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
    public func showToast(message: String, duration: TimeInterval = 1.5,
                          location: ToastViewLocation = ToastViewLocation.top,
                          style: ToastViewStyle = ToastDefaultStyle()) {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.keyWindow {
                let message = ToastMessage(message: message, duration: duration)
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
    public func showNotification(message: String, duration: TimeInterval = 1.5,
                                 style: ToastViewStyle = ToastDefaultStyle()) {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.keyWindow {
                let message = ToastMessage(message: message, duration: duration)
                let operation = ToastOperation(window: window, msg: message,
                                               location: ToastViewLocation.top,
                                               fabric: ToastNotificationFabric(), style: style)
                OperationQueue.main.addOperation(operation)
            }
        }
    }

    /**
     Cancel all toast messages
    */
    public func cancelAll() {
        DispatchQueue.main.async {
            let toastOperations = OperationQueue.main.operations.filter({ (item) -> Bool in
                return item is ToastOperation
            })

            for item in toastOperations {
                item.cancel()
            }
        }
    }
}

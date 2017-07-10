//
//  ToastMessage.swift

import UIKit

/**
 Message to be provided to ToastView. 
 Contains actual message, location and style. 
*/
struct ToastMessage: Hashable, Equatable {

    let message: String
    let duration: TimeInterval

    init(message: String, duration: TimeInterval) {
        self.message = message
        self.duration = duration
    }

    var hashValue: Int {
        return self.message.hashValue
    }

    static func == (lhs: ToastMessage, rhs: ToastMessage) -> Bool {
        // more than enough for now
        let areEqual = lhs.message == rhs.message
        return areEqual
    }
}

//
//  ToastMessage.swift

import UIKit

/**
 Message to be provided to ToastView. 
 Contains actual message, location and style. 
*/
struct ToastMessage: Hashable, Equatable {

    let msg: String
    let duration: TimeInterval

    init(msg: String, duration: TimeInterval) {
        self.msg = msg
        self.duration = duration
    }

    var hashValue: Int {
        return self.msg.hashValue
    }

    static func == (lhs: ToastMessage, rhs: ToastMessage) -> Bool {
        // more than enough for now
        let areEqual = lhs.msg == rhs.msg
        return areEqual
    }
}

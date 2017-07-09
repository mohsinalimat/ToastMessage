//
//  ToastLocation.swift

import UIKit

/**
 Enum of possible locations for Toast
*/
public enum ToastViewLocation {
    public static let `default` = ToastViewLocation.topSpace(margin: 80.0)
    public static let top = ToastViewLocation.topSpace(margin: 0)

    case topSpace(margin: Float)
    case bottomSpace(margin: Float)
}

//
//  ToastStyle.swift

import UIKit

/**
 Protocol for Toast Styles.
*/
public protocol ToastViewStyle {
    var backgroundColor: UIColor {get}
    var textColor: UIColor {get}
    var font: UIFont {get}
}

/**
 Default implementation for Toast Style.
 Black background, 16 System Font.
*/
public struct ToastDefaultStyle: ToastViewStyle {
    public var backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.8)
    public var textColor: UIColor = UIColor.white
    public var font: UIFont = UIFont.systemFont(ofSize: 16)

    public init() {

    }
}

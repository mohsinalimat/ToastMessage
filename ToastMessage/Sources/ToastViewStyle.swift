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
struct ToastDefaultStyle: ToastViewStyle {
    let backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.9)
    let textColor: UIColor = UIColor.white
    let font: UIFont = UIFont.systemFont(ofSize: 16)
}

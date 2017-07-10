# Toast Message

[![Build](https://travis-ci.org/Serheo/ToastMessage.svg?branch=master)](https://travis-ci.org/Serheo/ToastMessage)
![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Toast Messages for iOS 9.0 and higher. <br/>
Features: 
- All toasts are enqueued. One toast per time
- Customizable fonts, colors, duration and position of the message
- Different styles - Toast and notitication
- Toasts are automatically rotated

## Installation

#### Carthage
```
github "Serheo/ToastMessage"
```
#### CocoaPods
```
github "Serheo/ToastMessage"
```

## Getting Started

- **Import**
```swift
import ToastMessage
```

- **Show regular toast message**
```swift
ToastManager.shared.showToastMessage(msg: "Toast Message")
```

- **Show toast message with custom duration and location**
```swift
ToastManager.shared.showToast(message: "Show second message",
                                             duration: 3.0,
                                             location: ToastViewLocation.bottomSpace(margin: 80))
```

- **Show toast message with custom style**
```swift
struct ToastCustomStyle: ToastViewStyle {
    let backgroundColor: UIColor = UIColor.yellow
    let textColor: UIColor = UIColor.black
    let font: UIFont = UIFont.boldSystemFont(ofSize: 22)
}
ToastManager.shared.showToast(message: "Custom Message",
                                            duration: 2.0,
                                            location: ToastViewLocation.top,
                                            style: ToastCustomStyle())
```

See how is looks or try it in the Demo app.
![Toast screenshot](https://raw.github.com/Serheo/ToastMessage/master/Screenshots/ToastScreenshot.png)

- **Show regular notitication message**
```swift
ToastManager.shared.showNotification(message: "Top Message")
```

-  **Show notitication message with custom style**
```swift
struct NotificationCustomStyle: ToastViewStyle {
    let backgroundColor: UIColor = UIColor.orange
    let textColor: UIColor = UIColor.black
    let font: UIFont = UIFont.systemFont(ofSize: 16.0)
}
ToastManager.shared.showNotification(message: "Custom Message",
                                      duration: 2.0,
                                      style: NotificationCustomStyle())
```

- **Remove all toasts from the queue**
```swift
ToastManager.shared.cancelAll()
```

![Notification screenshot](https://raw.github.com/Serheo/ToastMessage/master/Screenshots/NotificationScreenshot.png)

## Requirements
iOS 9+
Swift

## License
ToastMessage is available under the MIT license. See the LICENSE file for more info.

//
//  ToastViewTests.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/8/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import XCTest
@testable import ToastMessage

class ToastViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testViewStyle() {
        let delegateMock = ToastDelegateMock()
        let testStyle = ToastTestStyle()
        let testMessage = ToastMessage(message: "Example", duration: 3.0)

        let viewSimple = ToastSimpleFabric().view(delegate: delegateMock,
                                                  message: testMessage, style: testStyle)
        let viewNotiticaion = ToastNotificationFabric().view(delegate: delegateMock,
                                                             message: testMessage, style: testStyle)

        let viewList = [viewNotiticaion, viewSimple]
        for view in viewList {
            testHelperToTestStyle(view: view, testStyle: testStyle, message: testMessage)
        }
    }

    func testDefaultViewStyle() {
        let delegateMock = ToastDelegateMock()
        let testStyle = ToastDefaultStyle()
        let testMessage = ToastMessage(message: "Example", duration: 3.0)
        let viewSimple = ToastSimpleFabric().view(delegate: delegateMock,
                                                  message: testMessage, style: testStyle)
        let viewList = [viewSimple]
        for view in viewList {
            testHelperToTestStyle(view: view, testStyle: testStyle, message: testMessage)
        }
    }

    func testHelperToTestStyle(view: UIView, testStyle: ToastViewStyle, message: ToastMessage) {
        XCTAssert(view.subviews.count > 0, "View should contains comething")

        guard let label = findViewOfClass(classType: UILabel.self, in: view) else {
            XCTFail("View should have label")
            return
        }

        guard let backView = findViewOfClass(classType: UIView.self, in: view) else {
            XCTFail("View should backView")
            return
        }

        XCTAssert(label.font == testStyle.font, "Should assign label font")
        XCTAssert(label.text == message.message, "Should assign label text")
        XCTAssert(label.textColor == testStyle.textColor, "Should assign label text color")
        XCTAssert(backView.backgroundColor == testStyle.backgroundColor, "Should assign view background")
    }

    func findViewOfClass<T: UIView>(classType: T.Type, in target: UIView) -> T? {
        for item in target.subviews {
            if let item = item as? T {
                return item
            } else {
                return findViewOfClass(classType: classType, in: item)
            }
        }
        return nil
    }
}

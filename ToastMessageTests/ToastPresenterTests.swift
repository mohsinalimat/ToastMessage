//
//  ToastPresenterTests.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/8/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import XCTest
@testable import ToastMessage

class ToastPresenterTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPresentToastw() {
        let simplePresenter: ToastPresenter = ToastSimplePresenter()
        let notifictationPresenter: ToastPresenter = ToastNotiticationPresenter()
        let presenterList = [simplePresenter, notifictationPresenter]

        for presenter in presenterList {
            let window = UIWindow()
            let target = UIView()

            let expect = expectation(description: "View should be added")
            presenter.present(target: target, with: ToastViewLocation.default, to: window) {
                expect.fulfill()

                let founded = window.subviews.filter({ (item) -> Bool in
                    return item == target
                })

                XCTAssert(founded.count == 1, "View should be added")
            }
            waitForExpectations(timeout: 7, handler: { error in
                if let error = error {
                    XCTFail("waitForExpectationsWithTimeout errored: \(error)")
                }
            })
        }
    }

    func testRemoveToast() {
        let simplePresenter: ToastPresenter = ToastSimpleFabric().presenter()
        let notifictationPresenter: ToastPresenter = ToastNotificationFabric().presenter()
        let presenterList = [simplePresenter, notifictationPresenter]

        for presenter in presenterList {
            let window = UIWindow()
            let target = UIView()
            window.addSubview(target)

            let expect = expectation(description: "View should be removed")
            presenter.removeFromHierarchy(target: target, removed: {
                expect.fulfill()

                let founded = window.subviews.filter({ (item) -> Bool in
                    return item == target
                })

                XCTAssert(founded.count == 0, "View should be removed")
            })

            waitForExpectations(timeout: 7, handler: { error in
                if let error = error {
                    XCTFail("waitForExpectationsWithTimeout errored: \(error)")
                }
            })
        }
    }
}

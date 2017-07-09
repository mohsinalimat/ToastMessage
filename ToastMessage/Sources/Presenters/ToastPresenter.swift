//
//  ToastPresenter.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/3/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit

protocol ToastPresenter {
    func present(target: UIView, with location: ToastViewLocation, to window: UIWindow, completed: @escaping () -> Void)
    func removeFromHierarchy(target: UIView, removed: @escaping () -> Void)
}

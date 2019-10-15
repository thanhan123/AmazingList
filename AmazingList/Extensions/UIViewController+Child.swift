//
//  UIViewController+Child.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import UIKit

extension UIViewController {
    func remove(childViewController: UIViewController) {
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
    }

    func add(childViewController: UIViewController, to subView: UIView) {
        addChild(childViewController)
        childViewController.view.frame = subView.bounds
        subView.addSubview(childViewController.view)
        childViewController.view.addConstaintsToFillSuperview()
        childViewController.didMove(toParent: self)
    }
}

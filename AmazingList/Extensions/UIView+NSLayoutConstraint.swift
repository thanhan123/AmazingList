//
//  UIView+NSLayoutConstraint.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import UIKit

extension UIView {
    func addConstaintsToFillSuperview(insets: UIEdgeInsets = .zero) {
        guard let superView = superview else {
            return
        }
        let safeAreaLayoutGuide = superView.safeAreaLayoutGuide
        activate(constraints:
            [
                topAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.topAnchor,
                    constant: insets.top
                ),
                leftAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.leftAnchor,
                    constant: insets.left
                ),
                rightAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.rightAnchor,
                    constant: insets.right
                ),
                bottomAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.bottomAnchor,
                    constant: insets.bottom
                )
            ]
        )
    }

    private func activate(constraints: [NSLayoutConstraint]) {
        constraints.forEach { constraint in
            (constraint.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate(constraints)
    }
}

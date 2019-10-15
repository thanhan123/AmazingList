//
//  MainContainerView.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import UIKit

class MainContainerView: BaseView {
    let horizontalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let verticalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func setupView() {
        super.setupView()
        addSubview(horizontalView)
        addSubview(verticalView)

        NSLayoutConstraint.activate(
            [
                horizontalView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                horizontalView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
                horizontalView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
                horizontalView.heightAnchor.constraint(equalToConstant: 100.0),

                verticalView.topAnchor.constraint(equalTo: horizontalView.bottomAnchor),
                verticalView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
                verticalView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
                verticalView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ]
        )
    }
}

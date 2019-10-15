//
//  MainContainerViewController.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import UIKit

class MainContainerViewController: BaseViewController<MainContainerView> {
    let horizontalListViewController: UIViewController
    let verticalListViewController: UIViewController
    let titleString: String

    init(horizontalListViewController: UIViewController,
         verticalListViewController: UIViewController,
         titleString: String) {
        self.horizontalListViewController = horizontalListViewController
        self.verticalListViewController = verticalListViewController
        self.titleString = titleString
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = titleString
        add(childViewController: horizontalListViewController, to: currentView.horizontalView)
        add(childViewController: verticalListViewController, to: currentView.verticalView)
    }
}

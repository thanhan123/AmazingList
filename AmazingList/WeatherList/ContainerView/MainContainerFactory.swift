//
//  MainContainerFactory.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/13/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import UIKit

struct MainContainerFactory {
    static func createNavigationCityWeatherListView() -> UINavigationController {
        return UINavigationController(
            rootViewController: MainContainerViewController(
                horizontalListViewController: HeaderWeatherListViewController(),
                verticalListViewController: ContentWeatherListViewController(),
                titleString: "City weather list"
            )
        )
    }
}

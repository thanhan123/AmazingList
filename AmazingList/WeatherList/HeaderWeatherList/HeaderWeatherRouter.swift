//
//  HeaderWeatherRouter.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import UIKit
import SafariServices

protocol HeaderWeatherRouter {
    func showWebView(for url: URL, from presenter: UIViewController)
}

struct HeaderWeatherRouterImpl: HeaderWeatherRouter {
    func showWebView(for url: URL, from presenter: UIViewController) {
        let safariVC = SFSafariViewController(url: url)
        presenter.present(safariVC, animated: true, completion: nil)
    }
}

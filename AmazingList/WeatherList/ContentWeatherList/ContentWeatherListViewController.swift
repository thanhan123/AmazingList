//
//  ContentWeatherListViewController.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

final class ContentWeatherListViewController: BaseViewController<UITableView> {
    private let dataSource = TableViewDataSource<Weather>(
        models: [],
        reuseIdentifier: NewsTableViewCell.name,
        cellConfigurator: { model, cell, _ in
            guard let cell = cell as? NewsTableViewCell else {
                return
            }
            cell.iconImageView.sd_setImage(
                with: model.imageURL,
                placeholderImage: UIImage(named: "not-found-place")!
            )
            cell.titleLabel.text = model.city
            cell.contentLabel.text = model.content
    })

    private let weatherListService: WeatherListService

    init(weatherListService: WeatherListService = WeatherListServiceImpl()) {
        self.weatherListService = weatherListService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        currentView.register(NewsTableViewCell.self,
                             forCellReuseIdentifier: NewsTableViewCell.name)
        currentView.dataSource = dataSource
        currentView.delegate = self
        currentView.tableFooterView = UIView()
        getWeatherList()
    }

    private func getWeatherList() {
        weatherListService
            .getWeatherList(maxiumResults: 50)
            .done(on: DispatchQueue.main, { [weak self] (weathers) in
                self?.dataSource.models = weathers
                self?.currentView.reloadData()
            })
    }
}

extension ContentWeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

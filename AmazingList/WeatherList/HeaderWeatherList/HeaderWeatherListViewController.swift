//
//  HeaderWeatherListViewController.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import UIKit

class HeaderWeatherListViewController: BaseViewController<HorizontalListView> {
    private let dataSource = CollectionViewDataSource(
        models: [Weather](),
        reuseIdentifier: ImageCollectionViewCell.name,
        cellConfigurator: { model, cell, _ in
            guard let cell = cell as? ImageCollectionViewCell else {
                return
            }
            cell.imageView.sd_setImage(
                with: model.imageURL,
                placeholderImage: UIImage(named: "not-found-place")!
            )
    })

    private let router: HeaderWeatherRouter
    private let weatherListService: WeatherListService
    private var timer: Timer?

    init(router: HeaderWeatherRouter = HeaderWeatherRouterImpl(),
         weatherListService: WeatherListService = WeatherListServiceImpl(),
         timeIntervalToRefresh: TimeInterval = 60) {
        self.router = router
        self.weatherListService = weatherListService
        super.init(nibName: nil, bundle: nil)
        timer = Timer.scheduledTimer(
            withTimeInterval: timeIntervalToRefresh,
            repeats: true,
            block: { [weak self] (timer) in
                self?.getWeatherList()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = HorizontalListView(dataSource: dataSource)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        currentView.delegate = self
        currentView.register(ImageCollectionViewCell.self,
                             forCellWithReuseIdentifier: ImageCollectionViewCell.name)
        currentView.showsHorizontalScrollIndicator = false
        getWeatherList()
    }

    private func getWeatherList() {
        weatherListService
            .getWeatherList(maxiumResults: 20)
            .done(on: DispatchQueue.main, { [weak self] (weathers) in
                self?.dataSource.models = weathers
                self?.currentView.reloadData()
            })
    }
}

extension HeaderWeatherListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        router.showWebView(for: dataSource.models[indexPath.item].infoURL, from: self)
    }
}

extension HeaderWeatherListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30.0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80.0, height: 80.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
}

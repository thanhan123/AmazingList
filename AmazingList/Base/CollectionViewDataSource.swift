//
//  CollectionViewDataSource.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import UIKit

class CollectionViewDataSource<Model>: NSObject, UICollectionViewDataSource {
    typealias CellConfigurator = (Model, UICollectionViewCell, IndexPath) -> Void
    typealias SupplementElementViewFactory = (UICollectionView, String, IndexPath) -> UICollectionReusableView

    var models: [Model]
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    private let supplementElementViewFactory: SupplementElementViewFactory?

    init(models: [Model],
         reuseIdentifier: String,
         cellConfigurator: @escaping CellConfigurator,
         supplementElementViewFactory: SupplementElementViewFactory? = nil) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
        self.supplementElementViewFactory = supplementElementViewFactory
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath
        )
        cellConfigurator(model, cell, indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if let view = supplementElementViewFactory?(collectionView, kind, indexPath) {
            return view
        }
        return UICollectionReusableView()
    }
}

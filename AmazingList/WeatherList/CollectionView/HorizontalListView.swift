//
//  HorizontalListView.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import UIKit

class HorizontalListView: UICollectionView {
    init(dataSource: UICollectionViewDataSource) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.dataSource = dataSource
        if #available(iOS 13.0, *) {
        } else {
            backgroundColor = UIColor.white
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

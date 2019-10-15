//
//  BaseView.swift
//  ANPhotoCollection
//
//  Created by Dinh Thanh An on 11/11/18.
//  Copyright © 2018 Dinh Thanh An. All rights reserved.
//

import UIKit

protocol View {
    func setupView()
}

class BaseView: UIView, View {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        if #available(iOS 13.0, *) {
        } else {
            backgroundColor = UIColor.white
        }
    }
}

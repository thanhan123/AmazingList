//
//  NSObject+Name.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import Foundation

extension NSObject {
    static var name: String {
        return String(describing: Self.self)
    }
}

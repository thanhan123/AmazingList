//
//  Weather.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let city: String
    let infoURL: URL
    let imageURL: URL
    let content: String
}

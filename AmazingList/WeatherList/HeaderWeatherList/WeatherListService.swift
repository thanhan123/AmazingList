//
//  WeatherListService.swift
//  AmazingList
//
//  Created by Dinh Thanh An on 10/12/19.
//  Copyright © 2019 Dinh Thanh An. All rights reserved.
//

import Foundation
import PromiseKit
import Firebase
import DictionaryCoding

protocol WeatherListService {
    func getWeatherList(maxiumResults: Int) -> Guarantee<[Weather]>
}

struct WeatherListServiceImpl: WeatherListService {
    private let weatherFirestore = Firestore.firestore().collection("weather")

    func getWeatherList(maxiumResults: Int) -> Guarantee<[Weather]> {
        let fields = ["city", "content", "imageURL", "infoURL"]
        let randomField = fields.randomElement() ?? ""
        return Guarantee { (resolver) in
            self.weatherFirestore
                .order(by: randomField)
                .limit(to: maxiumResults)
                .getDocuments { (snapshot, error) in
                    resolver(
                        snapshot?.documents.map { (document) -> Weather? in
                            let decoder = DictionaryDecoder()
                            return try? decoder.decode(Weather.self, from: document.data())
                        }.compactMap { $0 } ?? []
                    )
            }
        }
    }
}

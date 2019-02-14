//
//  Model.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/12/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import Foundation

struct Calculate {
    var price = 0.0
    var weight = 0.0
    
    func getPricePerWeight(price: Double, weight: Double) -> String {
        let itemValue = (price / 1000) * weight
        return String(format: "%.2f", itemValue)
    }
    
    func getPricePerKilogram(price: Double, weight: Double) -> String {
        let itemValue = (price / weight) * 1000
        return String(format: "%.2f", itemValue)
    }
}

//Как рассчитать цену за 1 кг. если товар идет в банках по 340 гр. цена банки 29750.
//Попроси больше объяснений Следить Отметить нарушение  Zhenka5590 09.06.2014
//Ответ
//Проверено экспертом
//Ответ дан
//Мамартела
//29750:340*1000 вот ответ 87500за один кг.

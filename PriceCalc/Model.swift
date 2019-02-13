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
    
    func getValue(price: Double, weight: Double) -> String {
        let itemValue = (price / 1000) * weight
        return String(format: "%.2f", itemValue)
    }
}

//
//  Model.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/12/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import Foundation

struct Calculate {
    let price: Float32
    let weight: Float32
    
    init(price: Float32, weight: Float32) {
        self.price = price
        self.weight = weight
    }
    
    func getValue(price: Float32, weight: Float32) -> String {
        let itemValue = (price / 1000) * weight
        return String(format: "%.2f", itemValue)
    }
    
}

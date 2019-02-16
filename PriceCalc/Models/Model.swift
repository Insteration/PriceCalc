//
//  Model.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/12/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import Foundation

protocol Calculate {
}

protocol Compare {
}

extension Calculate {
    func getPricePerWeight(price: Double, weight: Double) -> String {
        let itemValue = (price / 1000) * weight
        return String(format: "%.2f", itemValue)
    }
    
    func getPricePerKilogram(price: Double, weight: Double) -> String {
        let itemValue = (price / weight) * 1000
        return String(format: "%.2f", itemValue)
    }
}

extension Compare {
        
    func comparePrice(itemValueOne: String, itemValueTwo: String) -> String {
        var compare = String()
        if itemValueOne > itemValueTwo {
            compare = "itemValueOne > itemValueTwo"
        } else if itemValueOne < itemValueTwo {
            compare = "itemValueOne < itemValueTwo"
        } else {
            compare = "itemValueOne = itemValueTwo"
        }
        return compare
    }
}

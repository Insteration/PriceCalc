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
    var secondPrice = 0.0
    var secondWeight = 0.0
    
    func getPricePerWeight(price: Double, weight: Double) -> String {
        let itemValue = (price / 1000) * weight
        return String(format: "%.2f", itemValue)
    }
    
    func getPricePerKilogram(price: Double, weight: Double) -> String {
        let itemValue = (price / weight) * 1000
        return String(format: "%.2f", itemValue)
    }
    
    func getComparePricePerKilogram(firstPrice: Double, firstWeight: Double, secondPrice: Double, secondWeight: Double) -> String {
        
        var finalResult = String()
        
        let firstItemValue = (firstPrice / firstWeight) * 1000
        let secondItemValue = (secondPrice / secondWeight) * 1000
        
        if firstItemValue > secondItemValue {
            finalResult = "\(String(format: "%.2f", firstItemValue)) more than \(String(format: "%.2f", secondItemValue))"
        } else if firstItemValue < secondItemValue {
            finalResult = "\(String(format: "%.2f", firstItemValue)) little than \(String(format: "%.2f", secondItemValue))"
        } else if firstItemValue == secondItemValue {
            finalResult = "\(String(format: "%.2f", firstItemValue)) == \(String(format: "%.2f", secondItemValue))"
        }
        
//        return String(format: "%.2f", finalResult)
        return finalResult
    }
}


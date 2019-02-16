//
//  Model.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/12/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import Foundation

struct Calculate {
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
            finalResult = "Первый товар с ценой \(String(format: "%.2f", firstItemValue)) за килограмм меньше, чем второй товар с ценой \(String(format: "%.2f", secondItemValue)) за килограмм"
        } else if firstItemValue == secondItemValue {
            finalResult = "\(String(format: "%.2f", firstItemValue)) == \(String(format: "%.2f", secondItemValue))"
        }
        
        return finalResult
    }
    
    func getComparePricePerWeight(firstPrice: Double, firstWeight: Double, secondPrice: Double, secondWeight: Double) -> String {
        
        var finalResult = String()
        
        let firstItemValue = (firstPrice / firstWeight) * 1000
        let secondItemValue = (secondPrice / secondWeight) * 1000
        
        if firstItemValue > secondItemValue {
            finalResult = "\(String(format: "%.2f", firstItemValue)) more than \(String(format: "%.2f", secondItemValue))"
        } else if firstItemValue < secondItemValue {
            finalResult = "Первый товар с ценой \(String(format: "%.2f", firstItemValue)) за килограмм меньше, чем второй товар с ценой \(String(format: "%.2f", secondItemValue)) за килограмм"
        } else if firstItemValue == secondItemValue {
            finalResult = "\(String(format: "%.2f", firstItemValue)) == \(String(format: "%.2f", secondItemValue))"
        }
        
        return finalResult
    }
}


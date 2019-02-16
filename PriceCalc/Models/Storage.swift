//
//  Storage.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/15/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import Foundation

struct Data {
    var price = 0.0
    var weight = 0.0
    var secondPrice = 0.0
    var secondWeight = 0.0
    
    static var changeValue = 0

}

struct Storage {
    var mainMenu = ["Price product (Know price per 1 kg)", "Price product (Know price fo gramms)"]
}

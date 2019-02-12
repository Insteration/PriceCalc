//
//  ViewController.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/12/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Calculate(price: 0, weight: 0)
    
    @IBOutlet weak var itemPrice: UITextField!
    @IBOutlet weak var itemWeight: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    

    
    @IBAction func calculateValue(_ sender: UIButton) {
        resultLabel.text = model.getValue(price: Float32(itemPrice.text!)!, weight: Float32(itemWeight.text!)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


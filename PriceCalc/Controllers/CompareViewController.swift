//
//  CompareViewController.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/14/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class CompareViewController: UIViewController, Calculate, Compare {
    
    var storage = Storage()
    var data = Data()
    
    @IBOutlet weak var firstItemPrice: UITextField!
    @IBOutlet weak var firstItemWeight: UITextField!
    @IBOutlet weak var secondItemPrice: UITextField!
    @IBOutlet weak var secondItemWeight: UITextField!
    @IBOutlet weak var changeCalculateFormula: UISwitch!
    
    @IBAction func setupCalculateFormula(_ sender: UISwitch) {
        if changeCalculateFormula.isOn {
            showToast("Formula set up on PER KILO")
        } else {
            showToast("Formula set up on PER GRAMM")
        }
    }
    
    private func calculateValue() {
        if data.price == 0 || data.weight == 0 || data.secondWeight == 0 || data.secondPrice == 0 {
            getAlert()
        } else {
            if changeCalculateFormula.isOn {
                showToast(comparePrice(itemValueOne: getPricePerKilogram(price: data.price, weight: data.weight), itemValueTwo: getPricePerKilogram(price: data.secondPrice, weight: data.secondWeight)))
                print("CALCULATE BY GET COMPARE PRICE PER KILOGRAM")
            } else {
                showToast(comparePrice(itemValueOne: getPricePerWeight(price: data.price, weight: data.weight), itemValueTwo: getPricePerWeight(price: data.secondPrice, weight: data.secondWeight)))
                print("CALCULATE BY GET COMPARE PRICE PER WEIGHT")
            }

        }
    }
    
    private func getAlert() {
        let alert = UIAlertController(title: "Alert",
                                      message: "Please enter the required parameters",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        
        firstItemPrice.delegate = self
        firstItemWeight.delegate = self
        secondItemPrice.delegate = self
        secondItemWeight.delegate = self
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 12
            }
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height / 12
            }
        }
    }
}


extension CompareViewController {
    private func showToast(_ message: String) {
        let toastFrame = CGRect(x: self.view.frame.size.width / 2 - 150, y: self.view.frame.size.height - 400, width: 300, height: 80)
        let toastLabel = UILabel(frame: toastFrame)
        toastLabel.numberOfLines = 0
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 8.0, delay: 0.1, options: .curveEaseOut, animations: {toastLabel.alpha = 0.0}, completion: {(isCompleted) in toastLabel.removeFromSuperview()})
    }
}


extension CompareViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstItemPrice {
            textField.resignFirstResponder()
            firstItemWeight.becomeFirstResponder()
        } else if textField == firstItemWeight {
            textField.resignFirstResponder()
            secondItemPrice.becomeFirstResponder()
        } else if textField == secondItemPrice {
            textField.resignFirstResponder()
            secondItemWeight.becomeFirstResponder()
        } else if textField == secondItemWeight {
            textField.resignFirstResponder()
           calculateValue() 
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == firstItemPrice {
            data.price = Double(firstItemPrice.text!) ?? 0.0
            print("Price set up is \(data.price)")
        }
        if textField == firstItemWeight {
            data.weight = Double(firstItemWeight.text!) ?? 0.0
            print("Weight set up is \(data.weight)")
        }
        if textField == secondItemPrice {
            data.secondPrice = Double(secondItemPrice.text!) ?? 0.0
            print("Second price set up is \(data.secondPrice)")
        }
        if textField == secondItemWeight {
            data.secondWeight = Double(secondItemWeight.text!) ?? 0.0
            print("Second weight set up is \(data.secondWeight)")
        }
    }
}

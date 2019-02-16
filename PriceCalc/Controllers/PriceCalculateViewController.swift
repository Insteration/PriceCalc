//
//  ViewController.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/12/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class PriceCalculateViewController: UIViewController, Calculate {
    
    var storage = Storage()
    var data = Data()
    
    @IBOutlet weak var itemPrice: UITextField!
    @IBOutlet weak var itemWeight: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBAction func calculateValue(_ sender: UIButton) {
        calculateValue()
    }
    private func calculateValue() {
        if data.price == 0 || data.weight == 0 {
            getAlert()
        } else {
            if Data.changeValue == 0 {
                showToast(getPricePerWeight(price: data.price, weight: data.weight))
            } else {
                showToast(getPricePerKilogram(price: data.price, weight: data.weight))
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
        
        calculateButton.layer.cornerRadius = 10
        calculateButton.clipsToBounds = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        
        itemPrice.delegate = self
        itemWeight.delegate = self
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

extension PriceCalculateViewController {
    private func showToast(_ message: String) {
        let toastFrame = CGRect(x: self.view.frame.size.width / 2 - 150, y: self.view.frame.size.height / 3, width: 300, height: 80)
        let toastLabel = UILabel(frame: toastFrame)
        toastLabel.numberOfLines = 0
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        if Data.changeValue == 0 {
            toastLabel.text = "Price will be" + " " + message + " " + "UAH"
        } else {
            toastLabel.text = "Price will be" + " " + message + " " + "UAH"
        }
        toastLabel.alpha = 1
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 8.0, delay: 0.1, options: .curveEaseOut, animations: {toastLabel.alpha = 0.0}, completion: {(isCompleted) in toastLabel.removeFromSuperview()})
    }
}


extension PriceCalculateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == itemPrice {
            textField.resignFirstResponder()
            itemWeight.becomeFirstResponder()
        } else if textField == itemWeight {
            textField.resignFirstResponder()
            calculateValue()
        }
        return false
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == itemPrice {
            data.price = Double(itemPrice.text!) ?? 0.0
            print("Price set up is \(data.price)")
        }
        if textField == itemWeight {
            data.weight = Double(itemWeight.text!) ?? 0.0
            print("Weight set up is \(data.weight)")
        }
    }
    
}

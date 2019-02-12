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
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        itemPrice.delegate = self
        itemWeight.delegate = self
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 4.5
            }
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height / 4.5
            }
        }
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == itemPrice {
            textField.resignFirstResponder()
            itemWeight.becomeFirstResponder()
        } else if textField == itemWeight {
            textField.resignFirstResponder()
            
        }
        return false
    }
    
//    textF
}

//if textField == userTextField[0] {
//    textField.resignFirstResponder()
//    userTextField[1].becomeFirstResponder()
//} else if textField == userTextField[1] {
//    textField.resignFirstResponder()
//    if dataMethods.emailPasswordCheckOnEmpty(userTextField[1].text!) {
//        performAction()
//    }
//}
//return false

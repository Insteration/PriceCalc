//
//  CompareViewController.swift
//  PriceCalc
//
//  Created by Artem Karmaz on 2/14/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class CompareViewController: UIViewController {
    
    var model = Calculate()
    var storage = Storage()
    
    @IBOutlet weak var firstItemPrice: UITextField!
    @IBOutlet weak var firstItemWeight: UITextField!
    @IBOutlet weak var secondItemPrice: UITextField!
    @IBOutlet weak var secondItemWeight: UITextField!

//    @IBAction func backToMainMenu(_ sender: UIBarButtonItem) {
//        dismiss(animated: true, completion: nil)
//    }
    
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
        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
            if model.price == 0 || model.weight == 0 || model.secondWeight == 0 || model.secondPrice == 0 {
                getAlert()
            } else {
                showToast(model.getComparePricePerKilogram(firstPrice: model.price, firstWeight: model.weight, secondPrice: model.secondPrice, secondWeight: model.secondWeight))
            }
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == firstItemPrice {
            model.price = Double(firstItemPrice.text!) ?? 0.0
            print("Price set up is \(model.price)")
        }
        if textField == firstItemWeight {
            model.weight = Double(firstItemWeight.text!) ?? 0.0
            print("Weight set up is \(model.weight)")
        }
        if textField == secondItemPrice {
            model.secondPrice = Double(secondItemPrice.text!) ?? 0.0
            print("Second price set up is \(model.secondPrice)")
        }
        if textField == secondItemWeight {
            model.secondWeight = Double(secondItemWeight.text!) ?? 0.0
            print("Second weight set up is \(model.secondWeight)")
        }
    }
}

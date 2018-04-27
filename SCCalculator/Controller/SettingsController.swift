//
//  SettingsController.swift
//  SCCalculator
//
//  Created by Patrice Bender on 23.04.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    static var registerId = 1
    static var cashierName: String!
    static var opponent: String!
    
    @IBOutlet weak var cashierName: UITextField!
    @IBOutlet weak var registerId: UITextField!
    @IBOutlet weak var opponent: UITextField!
    
    @IBAction func textFieldFocus(_ sender: UITextField) {
        sender.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        sender.layer.borderWidth = 1.0
    }
    
  
    @IBAction func saveSettings(_ sender: Any) {
        if (!markEmptyTextfield()){
            showAlert()
        }else{
            
        }
    }
    
    private func markEmptyTextfield() -> Bool {
        if cashierName.text == "" {
            cashierName.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            cashierName.layer.borderWidth = 1.0
            return false
        }
        if registerId.text == "" {
            registerId.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            registerId.layer.borderWidth = 1.0
            return false
        }
        if opponent.text == "" {
            opponent.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            opponent.layer.borderWidth = 1.0
            return false
        }
        return true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.hideKeyboardWhenTappedAround()


    }
    
    fileprivate func showAlert() {
        let alert = UIAlertController(title: "Fehler", message: "Bitte markierte Felder ausfüllen!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
 
}

//Extension for UIController to dismiss Keyboard when focus is not in textfield anymore
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

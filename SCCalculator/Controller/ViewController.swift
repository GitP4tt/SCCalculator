//
//  ViewController.swift
//  SCCalculator
//
//  Created by Patrice Bender on 16.03.18.
//  Copyright © 2018 Patrice Bender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var multiplier = 1
    var resultDisplayed = false ;
    var dbController = DatabaseController()
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var calculatorLabel: UILabel!
    @IBOutlet weak var orderLabel: UITextView!
    @IBOutlet weak var mulitplierView: UIStackView!
    

// Superclass methods
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ModelController.currentOrder.positions.count > 0 {
            updateViewFromModel()
        }else{
            showStatistics(AnyClass.self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
//   Actions
    
   
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        if resultDisplayed {
            resetUI()
            resultDisplayed = false
        }
        
        
        let newProduct = Product(name: sender.currentTitle!)
        let position = Position(product: newProduct, multiplier: multiplier)
        
        ModelController.currentOrder.add(new: position)
        
        updateViewFromModel()
        
        mulitplierView.isUserInteractionEnabled = true
        multiplier = 1
        
    }
   
    @IBAction func multiplierChanged(_ sender: UIButton) {
        mulitplierView.isUserInteractionEnabled = false
        let multiplier = sender.currentTitle!
        self.multiplier = Int(multiplier)!
    }
    
    
    @IBAction func showStatistics(_ sender: Any) {
        resultDisplayed = true
        resetUI()
        calculatorLabel.text = String(ModelController.matchday.revenue)
        orderLabel.text = String(ModelController.matchday.getStatistics())
    }
    
    @IBAction func reset(_ sender: Any) {
        resetUI()
    }
    
    
    @IBAction func deleteLastPosition(_ sender: UIButton) {
        if  ModelController.currentOrder.positions.count > 0 {
            ModelController.currentOrder.deleteLast()
            self.updateViewFromModel()
        }
        self.multiplier = 1
        mulitplierView.isUserInteractionEnabled = true
    }
    
    func resetUI() {
        mulitplierView.isUserInteractionEnabled = true
        
        if (ModelController.currentOrder.positions.count > 0){
            ModelController.matchday.add(new: ModelController.currentOrder)
            dbController.upload(order: ModelController.currentOrder)
            
        }
        ModelController.currentOrder = Order()
        updateViewFromModel()

    }
    
   

    func updateViewFromModel() {
       
        var newLabelText: String = ""
        
        for position in ModelController.currentOrder.positions {
            newLabelText += position.description + "\n"
        }
        
        orderLabel.text = newLabelText
        calculatorLabel.text = String(ModelController.currentOrder.orderTotal)
    }
  
}


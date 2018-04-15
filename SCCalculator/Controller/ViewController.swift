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
    var matchday = Matchday()
    var currentOrder = Order()
    var resultDisplayed = false ;
    
    @IBOutlet weak var calculatorLabel: UILabel!
    @IBOutlet weak var orderLabel: UITextView!
    @IBOutlet weak var mulitplierView: UIStackView!

    

   
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        if resultDisplayed {
            resetUI()
            resultDisplayed = false
        }
        
        
        let newProduct = Product(productName: sender.currentTitle!)
        let position = Position(product: newProduct, multiplier: multiplier)
        
        currentOrder.add(new: position)
        
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
        calculatorLabel.text = String(matchday.umsatz)
        orderLabel.text = String(matchday.getStatistics())
    }
    
    func resetUI() {
        mulitplierView.isUserInteractionEnabled = true
        
        if (currentOrder.positions.count>0){
            matchday.add(new: currentOrder)
            
        }
        currentOrder = Order()
        updateViewFromModel()

    }
    
    @IBAction func reset(_ sender: Any) {
        resetUI()
    }
    
    
    @IBAction func deleteLastPosition(_ sender: UIButton) {
        if(self.currentOrder.positions.count > 0){
            self.currentOrder.deleteLast()
            self.updateViewFromModel()
        }
        self.multiplier = 1
        mulitplierView.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateViewFromModel() {
       
        var newLabelText: String = ""
        for position in currentOrder.positions {
                newLabelText += position.description + "\n"
        }
        orderLabel.text = newLabelText
        calculatorLabel.text = String(currentOrder.orderTotal)
    }
   
}


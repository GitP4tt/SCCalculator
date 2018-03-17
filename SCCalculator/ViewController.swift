//
//  ViewController.swift
//  SCCalculator
//
//  Created by Patrice Bender on 16.03.18.
//  Copyright © 2018 Patrice Bender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mulitplierView: UIStackView!
    var currentPrice = 0.0
    var currentMultiplier = 1
    @IBOutlet weak var calculatorLabel: UILabel!
    @IBOutlet weak var bestellungen: UILabel!
    
    var pricelist = ["Bier": 5.2,
                            "Soft": 4.4,
                            "Glueh": 4.4,
                            "Kaffee": 2,
                            "Tee": 3,
                            "Wein": 4.4,
                            "Wurst": 2.8,
                            "Merquez": 3.4]

   
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let product = sender.currentTitle!
        let positionPrice = Double(currentMultiplier)*pricelist[product]!
        let position = (String(currentMultiplier) + " x " + String(product) + " = " + String(positionPrice))

       currentPrice = currentPrice + positionPrice
        
        
        calculatorLabel.text = String(currentPrice)
        bestellungen.text = (bestellungen.text! + "\n" + position)

        mulitplierView.isUserInteractionEnabled = true
        
    
        
        currentMultiplier = 1
        
    }
    
    @IBAction func multiplierChanged(_ sender: UIButton) {
        mulitplierView.isUserInteractionEnabled = false
        let  multiplier = sender.currentTitle!
        currentMultiplier = Int(multiplier)!
    }
    
    
    @IBAction func reset(_ sender: Any) {
        
        currentPrice = 0
        mulitplierView.isUserInteractionEnabled = true
        calculatorLabel.text = String(currentPrice)
        bestellungen.text = ""

    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
}


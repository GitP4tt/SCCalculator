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
    var spieltag = Spieltag()
    var bestellung = Bestellung()
    var resultDisplayed = false ;
    
    @IBOutlet weak var calculatorLabel: UILabel!
    @IBOutlet weak var bestellungenLabel: UITextView!
    @IBOutlet weak var mulitplierView: UIStackView!

    

   
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        if resultDisplayed {
            resetAnzeige()
            resultDisplayed = false
        }
        
        
        let produkt = Produkt(productName: sender.currentTitle!)
        let position = Position(produkt: produkt, anzahl: multiplier)
        
        bestellung.hinzufuegen(position)
        
        updateViewFromModel()
        
        mulitplierView.isUserInteractionEnabled = true
        multiplier = 1
        
    }
   
    @IBAction func multiplierChanged(_ sender: UIButton) {
        mulitplierView.isUserInteractionEnabled = false
        let multiplier = sender.currentTitle!
        self.multiplier = Int(multiplier)!
    }
    
    
    @IBAction func zeigeZwischenstand(_ sender: Any) {
        resultDisplayed = true
        resetAnzeige()
        calculatorLabel.text = String(spieltag.umsatz)
        bestellungenLabel.text = String(spieltag.getStatistics())
    }
    
    func resetAnzeige() {
        mulitplierView.isUserInteractionEnabled = true
        
        if (bestellung.positionen.count>0){
            spieltag.hinzufuegen(neue: bestellung)
            
        }
        bestellung = Bestellung()
        updateViewFromModel()

    }
    
    @IBAction func reset(_ sender: Any) {
        resetAnzeige()
    }
    
    
    @IBAction func deleteLastPosition(_ sender: UIButton) {
        if(self.bestellung.elementCount > 0){
            self.bestellung.deleteLast()
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
        for bestellPosition in bestellung.positionen {
                newLabelText += bestellPosition.description
        }
        bestellungenLabel.text = newLabelText
        calculatorLabel.text = String(bestellung.bestellwert)
    }
   
}


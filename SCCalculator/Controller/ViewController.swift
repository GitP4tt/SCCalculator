//
//  ViewController.swift
//  SCCalculator
//
//  Created by Patrice Bender on 16.03.18.
//  Copyright © 2018 Patrice Bender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var auswahlAnzahl = 1
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
        let position = Position(produkt: produkt, anzahl: auswahlAnzahl)
        
        bestellung.hinzufuegen(position)
        
        updateViewFromModel()
        
        mulitplierView.isUserInteractionEnabled = true
        auswahlAnzahl = 1
        
    }
    func updateViewFromModel() {
        calculatorLabel.text = String(bestellung.bestellwert)
        var newLabelText: String?
        for bestellPosition in bestellung.positionen {
             newLabelText = bestellungenLabel.text! + "\n"  + bestellPosition.description
        }
        bestellungenLabel.text = newLabelText ?? ""

    }
    @IBAction func multiplierChanged(_ sender: UIButton) {
        mulitplierView.isUserInteractionEnabled = false
        let multiplier = sender.currentTitle!
        auswahlAnzahl = Int(multiplier)!
    }
    
    
    @IBAction func zeigeZwischenstand(_ sender: Any) {
        resultDisplayed = true
        resetAnzeige()
        calculatorLabel.text = String(spieltag.umsatz)
        bestellungenLabel.text = String("Anzahl Bestellungen: " + String(spieltag.bestellListe.count) + "\n" + spieltag.getStatistics())
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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
}


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
    
    @IBOutlet weak var calculatorLabel: UILabel!
    @IBOutlet weak var bestellungenLabel: UILabel!
    @IBOutlet weak var mulitplierView: UIStackView!

    

   
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        
        
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
        resetAnzeige()
        calculatorLabel.text = String(spieltag.umsatz)
    }
    
    func resetAnzeige() {
        mulitplierView.isUserInteractionEnabled = true
        spieltag.hinzufuegen(neue: bestellung)
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


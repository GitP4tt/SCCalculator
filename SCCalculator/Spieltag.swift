//
//  Spieltag.swift
//  SCCalculator
//
//  Created by Patrice Bender on 28.03.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation

class Spieltag {
    private(set) var bestellListe = Array<Bestellung>()
    var umsatz: Double {
        get{
            var umsatz: Double = 0.0
            for dieBestellung in bestellListe {
                umsatz += dieBestellung.bestellwert
            }
            return umsatz
        }
    }
    
    func hinzufuegen(neue bestellung:Bestellung) {
        bestellListe.append(bestellung)
    }
    
    func getLetzteBestellung() -> Bestellung {
        return bestellListe.last ?? Bestellung()
    }
    
    func getStatistics() -> String {
        bestellListe.sort()
        let maxBestellwert = bestellListe.first?.bestellwert ?? 0
        
        return "Max Bestellwert: " + String(maxBestellwert)
    }
}

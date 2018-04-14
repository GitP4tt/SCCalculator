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
    
    
    private var maxBestellwert: Double?{
        
        get{
            return bestellListe.first?.bestellwert ?? 0
        }
    }
    
    private var averageOrderValue: Double?{
        get{
            var sum = 0.0;

            for bestellung:Bestellung in bestellListe {
                sum += bestellung.bestellwert
            }
            return round(sum / Double(bestellListe.count)*100)/100
        }
    }
    
    private var bestSeller: (key: String, value: Int){
        get{
            return Position.productCount.max { a, b in a.value < b.value }!
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

        let orderCount = "Anzahl Bestellungen: " + String(self.bestellListe.count)
        let maxBestellwert = "Max Bestellwert: " + String(self.maxBestellwert!)
        let durchschnittlicherBestellwert = "Ø Bestellwert: " + String(self.averageOrderValue!)
        let bestSeller = "Best Seller: " + self.bestSeller.key + " (x" + String(self.bestSeller.value) + ")"
        
        
        let output = orderCount + "\n" + maxBestellwert + "\n" + durchschnittlicherBestellwert + "\n" + bestSeller
        
        
        return output
        
    }
}

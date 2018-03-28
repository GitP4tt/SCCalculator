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
    
    func hinzufuegen(neue bestellung:Bestellung) {
        bestellListe.append(bestellung)
    }
    
    func getLetzteBestellung() -> Bestellung {
        return bestellListe.last ?? Bestellung()
    }
    
    
}

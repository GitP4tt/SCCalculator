//
//  Position.swift
//  SCCalculator
//
//  Created by Patrice Bender on 28.03.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation

struct Position {
    
    private(set) var produkt: Produkt?
    private(set) var anzahl = 1.0
    
    private(set) var positionsWert: Double {
        get{
            return (produkt!.preis * anzahl)
        }
    }
    
    init(produkt: Produkt,anzahl: Int ) {
        self.produkt = produkt
        self.anzahl = Double(anzahl)
    }
    
}

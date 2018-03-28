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
    private(set) var anzahl = 1
    
    var positionsWert: Double {
        get{
            return (produkt!.preis * Double(anzahl))
        }
    }
    
    init(produkt: Produkt,anzahl: Int ) {
        self.produkt = produkt
        self.anzahl = anzahl
    }
    
    public var description: String { return "\(anzahl) x \(produkt!.name) = \(positionsWert)" }
    
}

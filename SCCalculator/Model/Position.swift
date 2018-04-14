//
//  Position.swift
//  SCCalculator
//
//  Created by Patrice Bender on 28.03.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation

class Position {
    
    private(set) var produkt: Produkt?
    private(set) var anzahl = 1
    public static var productCount = ["Bier": 0,
                    "Radler": 0,
                    "Soft": 0,
                    "Glueh": 0,
                    "Kaffee": 0,
                    "Tee": 0,
                    "Wein": 0,
                    "Sauer": 0,
                    "Kaese": 0,
                    "Merquez": 0,
                    "Schorle": 0,
                    "Rote": 0,
                    "🥨": 0,
                    "🥤": 0]
    
 
    var positionsWert: Double {
        get{
            return (produkt!.preis * Double(anzahl))
        }
    }
    
    
    
    
    
    init(produkt: Produkt,anzahl: Int ) {
        self.produkt = produkt
        self.anzahl = anzahl
        Position.productCount[produkt.name]! += 1
    }
    
    public var description: String { return "\(anzahl) x \(produkt!.name) = \(positionsWert)" }
    
}

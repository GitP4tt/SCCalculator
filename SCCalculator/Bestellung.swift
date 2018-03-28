//
//  Bestellung.swift
//  SCCalculator
//
//  Created by Patrice Bender on 28.03.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation

class Bestellung{
    private(set) var bestellwert = 0.0
    private(set) var positionen = Array<Position>()
    
    
    func hinzufuegen(_ position: Position){
        positionen.append(position)
        bestellwert += position.positionsWert
    }
}

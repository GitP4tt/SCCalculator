//
//  Bestellung.swift
//  SCCalculator
//
//  Created by Patrice Bender on 28.03.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation

class Bestellung: Comparable{
    
    static func < (lhs: Bestellung, rhs: Bestellung) -> Bool {
        if (lhs.bestellwert > rhs.bestellwert){
            return true
        }
        return false
    }
    
    static func == (lhs: Bestellung, rhs: Bestellung) -> Bool {
        if (lhs == rhs) {return true}
        else            {return false}
    }
    
    private(set) var bestellwert = 0.0
    var elementCount = 0
    
    private(set) var positionen = Array<Position>()
    
    
    func hinzufuegen(_ position: Position){
        positionen.append(position)
        bestellwert += position.positionsWert
        elementCount += 1
    }
    
    func deleteLast(){
        let lastPosition = positionen.popLast()!
        bestellwert -= lastPosition.positionsWert
        if(positionen.count == 0) {
            bestellwert = 0
        }
        Position.productCount[lastPosition.produkt!.name]! -= lastPosition.anzahl * 1
        
        elementCount -= 1
    }
}

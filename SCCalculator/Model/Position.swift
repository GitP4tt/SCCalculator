//
//  Position.swift
//  SCCalculator
//
//  Created by Patrice Bender on 28.03.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation

class Position {
    
    private(set) var product: Product?
    private(set) var multiplier = 1
   
    
 
    var positionValue: Double {
        get{
            return Double(round((product!.preis * Double(multiplier))*100)/100)
        }
    }
    
    init(product: Product,multiplier: Int ) {
        self.product = product
        self.multiplier = multiplier
        Product.productCount[product.name]! +=  (1 * multiplier)
    }
    
    public var description: String { return "\(multiplier) x \(product!.name) = \(positionValue)" }
    
}

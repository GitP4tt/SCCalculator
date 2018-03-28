//
//  Product.swift
//  SCCalculator
//
//  Created by Patrice Bender on 28.03.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation


struct Produkt {
    private(set) var name = String()
    
    var preis: Double{
        get{
            return pricelist[name]!
        }
    }
    
    init(productName: String) {
        self.name = productName
        
    }
    
    var pricelist = ["Bier": 5.2,
                     "Soft": 4.4,
                     "Glueh": 4.4,
                     "Kaffee": 2,
                     "Tee": 3,
                     "Wein": 4.4,
                     "Wurst": 2.8,
                     "Merquez": 3.4,
                     "🥤": -1.0]
}

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
    private(set) var preis = Double()
    
    init(productName: String, produktPreis: Double) {
        self.name = productName
        self.preis = produktPreis
    }
}

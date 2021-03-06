//
//  Product.swift
//  SCCalculator
//
//  Created by Patrice Bender on 28.03.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation


struct Product {
    
    private(set) var name = String()
    
    var preis: Double{
        get{
            return Product.pricelist[name]!
        }
    }
    
    var productId: Int{
        get{
            return Product.databaseId[name]!
        }
    }
    
    init(name: String) {
        self.name = name
        
    }
    public static var productCount = ["Bier": 0,
                                      "Radler": 0,
                                      "Cola": 0,
                                      "Fanta": 0,
                                      "Sprite": 0,
                                      "Wasser": 0,
                                      "Mezzo": 0,
                                      "Apfel": 0,
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
                                      "🥤": 0,
                                      "fanta": 0,
                                      "apfel": 0,
                                      "wein": 0,
                                      "schorle": 0,
                                      "cola": 0,
                                      "sprite": 0,
                                      "wasser": 0,
                                      "mezzo": 0,
                                      ]
    
    static var pricelist = ["Bier": 5.2,
                            "Radler": 5.2,
                            "Cola": 4.4,
                            "Fanta": 4.4,
                            "Sprite": 4.4,
                            "Wasser": 4.4,
                            "Mezzo": 4.4,
                            "Apfel": 4.4,
                            "Glueh": 4.4,
                            "Kaffee": 2,
                            "Tee": 3,
                            "Wein": 4,
                            "Sauer": 5.2,
                            "Kaese": 2.8,
                            "Merquez": 3.4,
                            "Schorle": 3.8,
                            "Rote": 2.8,
                            "🥨": 1.0,
                            "🥤": -1.0,
                            "fanta": 3.6,
                            "apfel": 3.6,
                            "wein": 3.6,
                            "schorle": 3.6,
                            "cola": 3.6,
                            "sprite": 3.6,
                            "wasser": 3.6,
                            "mezzo": 3.6
                            ]
    
    public static var databaseId = ["Bier": 1,
                                    "Radler": 2,
                                    "Cola": 8,
                                    "Fanta": 9,
                                    "Sprite": 11,
                                    "Wasser": 12,
                                    "Mezzo": 10,
                                    "Apfel": 13,
                                    "Glueh": 0,
                                    "Kaffee": 6,
                                    "Tee": 7,
                                    "Wein": 4,
                                    "Sauer": 3,
                                    "Kaese": 15,
                                    "Merquez": 16,
                                    "Schorle": 5,
                                    "Rote": 14,
                                    "🥨": 18,
                                    "🥤": 17,
                                    "fanta": 19,
                                    "apfel": 20,
                                    "wein": 21,
                                    "schorle": 22,
                                    "cola": 23,
                                    "sprite": 24,
                                    "wasser": 25,
                                    "mezzo": 26]
}

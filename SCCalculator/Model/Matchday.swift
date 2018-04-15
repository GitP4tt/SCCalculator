//
//  Spieltag.swift
//  SCCalculator
//
//  Created by Patrice Bender on 28.03.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation

class Matchday {
    
    private(set) var orderList = Array<Order>()
    
    
    var umsatz: Double {
        get{
            var revenue: Double = 0.0
            for order in orderList {
                revenue += order.orderTotal
            }
            return revenue
        }
    }
    
    
    private var maxOrderValue: Double?{
        
        get{
            orderList.sort()
            return orderList.first?.orderTotal ?? 0
        }
    }
    
    private var averageOrderValue: Double?{
        get{
            var sum = 0.0;

            for order:Order in orderList {
                sum += order.orderTotal
            }
            return round(sum / Double(orderList.count)*100)/100
        }
    }
    
    private var bestSeller: (key: String, value: Int){
        get{
            return Product.productCount.max { a, b in a.value < b.value }!
        }
    }
    
    func add(new order:Order) {
        orderList.append(order)
    }
    
    func getLetzteBestellung() -> Order {
        return orderList.last ?? Order()
    }
    
    func getStatistics() -> String {

        let orderCount = "Anzahl Bestellungen: " + String(self.orderList.count)
        let maxOrderTotal = "Max Bestellwert: " + String(self.maxOrderValue!)
        let averageOrderTotal = "Ø Bestellwert: " + String(self.averageOrderValue!)
        let bestSeller = "Best Seller: " + self.bestSeller.key + " (x" + String(self.bestSeller.value) + ")"
        
        
        let output = orderCount + "\n" + maxOrderTotal + "\n" + averageOrderTotal + "\n" + bestSeller
        
        
        return output
        
    }
}

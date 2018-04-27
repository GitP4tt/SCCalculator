//
//  Bestellung.swift
//  SCCalculator
//
//  Created by Patrice Bender on 28.03.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation

class Order: Comparable{
    
    private(set) var orderTotal = 0.0
    private(set) var positions = Array<Position>()
    let orderId = UUID().uuidString
    
    
    func add(new position: Position){
        positions.append(position)
        orderTotal += position.positionValue
    }
    
    func deleteLast(){
        
        let lastPosition = positions.popLast()!
        orderTotal -= lastPosition.positionValue
        
            if(positions.count == 0) {
                orderTotal = 0
            }
        
        Product.productCount[lastPosition.product!.name]! -= lastPosition.multiplier * 1
        
        }
    
    
    static func < (lhs: Order, rhs: Order) -> Bool {
        if (lhs.orderTotal > rhs.orderTotal){
            return true
        }
        return false
    }
    
    static func == (lhs: Order, rhs: Order) -> Bool {
        if (lhs == rhs) {return true}
        else            {return false}
    }
}

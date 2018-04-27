//
//  DatabaseController.swift
//  SCCalculator
//
//  Created by Patrice Bender on 25.04.18.
//  Copyright © 2018 Patrice.Codes. All rights reserved.
//

import Foundation

class DatabaseController {
    
    private let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
    private var count = 0;
    
    
    //uploads an order to the db, returns true if succeded
     func upload(order: Order) {
        
        var urlPath: String = "https://patrice.codes/OrderService.php?"
        
        urlPath += "OrderId=" + order.orderId
        urlPath += "&MatchId=" + String(ModelController.matchday.matchDayId)
        urlPath += "&Total="   + String(order.orderTotal)
        urlPath += "&RegisterId=" + String(SettingsController.registerId)
        
        if(!processDataBaseRequest(requestUrl: urlPath)) {
            print("Failed to uplod Order with Id: " + order.orderId)
        }

        for position in order.positions {
            upload(position: position, with: order.orderId)
        }
    }
    
    
    func upload(position: Position,with orderId: String){
        
        var urlPath: String = "https://patrice.codes/PositionService.php?"
        urlPath +=  "OrderId=" + orderId
        urlPath += "&Multiplier=" + String(position.multiplier)
        urlPath +=  "&PositionTotal=" + String(position.positionValue)
        urlPath +=  "&ProductId=" + String(position.product!.productId)
     
        
        if(!processDataBaseRequest(requestUrl: urlPath)) {
            print("Failed to uplod position in order: " + orderId)
        }
    }
    
    
    
    func processDataBaseRequest(requestUrl: String) -> Bool{
        let url: URL = URL(string: requestUrl)!
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            print(requestUrl)
            
        }
        if(task.error != nil) {
            return false
        }
        task.resume()
        return true
        
    }
    
    
    init() {
    }
}

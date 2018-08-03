//
//  Transaction.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import Foundation

struct Transaction {
    var timestamp:Date!
    var toAddress:String!
    var fromAddress:String?
    var amount:Float!
    
    init(json:[String:Any]) {
        if let dateString = json[Response.timestamp] as? String {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            if let date = dateFormatter.date(from: dateString) {
                timestamp = date
            }

        }
        
        if let toString = json[Response.toAddress] as? String {
            toAddress =  toString
        }
        
        if let amountString = json[Response.amount] as? String, let amountFloat = Float(amountString) {
            amount = amountFloat
        }
        
        fromAddress = json[Response.fromAddress] as? String

    }
    
    init(timestamp: Date, toAddress:String, fromAddress:String, amount:Float) {
        self.timestamp = timestamp
        self.toAddress = toAddress
        self.fromAddress = fromAddress
        self.amount = amount
    }
}

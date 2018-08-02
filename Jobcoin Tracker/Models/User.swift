//
//  User.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import Foundation

struct User {
    var balance:Float = 0
    var transactions:[Transaction] = []
    var address:String!
    
    init() {}
    
    init(address:String, json:[String:Any]) {
        self.address = address
        if let balanceString = json[Response.balance] as? String, let balanceFloat = Float(balanceString) {
            balance = balanceFloat
        }
        
        if let transDicts = json[Response.transactions] as? [[String:Any]] {
            transactions = []
            for trans in transDicts {
                transactions.append(Transaction(json: trans))
            }
        }
    }
    

}

//
//  Constants.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import Foundation

struct ViewControllerIds {
    static let MainViewController   = "MainVC"
}

struct Urls {
    private static let baseUrl = "http://jobcoin.gemini.com/finisher/api/"
    static let addressInfo     = baseUrl + "addresses/"
    static let transactions    = baseUrl + "transactions"
}

struct Paramters {
    static let address     = "address"
    static let fromAddress = "fromAddress"
    static let toAddress   = "toAddress"
    static let amount      = "amount"
}

struct Response {
    static let balance      = "balance"
    static let transactions = "transactions"
    static let timestamp    = "timestamp"
    static let toAddress    = "toAddress"
    static let fromAddress  = "fromAddress"
    static let amount       = "amount"
    static let status       = "status"
    static let error        = "error"
}

struct CellIDs {
    static let currentBalance = "currentBalanceCell"
    static let graph          = "graphCell"
    static let send           = "sendCell"
    static let transaction    = "transactionCell"
}

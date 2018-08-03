//
//  TransactionHelper.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import Foundation
import Alamofire

struct TransactionHelper {
    static func send (toAddress:String, amount:Float, completion:@escaping (_ success:Bool, _ error:String?)->Void) {
        //Send transaction to api
        let url = Urls.transactions
        let parameters:[String:Any] = [
            Paramters.fromAddress:User.current().address,
            Paramters.toAddress: toAddress,
            Paramters.amount: "\(amount)"]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.isSuccess, let code = response.response?.statusCode, code == 200 {
                //If successful, update current user's information and let main view know - if not, display error message
                User.updateBalance(amount: -amount)
                User.addTransaction(transaction: Transaction(timestamp: Date(), toAddress: toAddress, fromAddress: User.current().address, amount: amount))
                completion(true, nil)
            }else if response.result.isSuccess, let json = response.result.value as? [String:Any], let error = json[Response.error] as? String {
                completion(false, error)
            }else {
                completion(false, response.result.error.debugDescription)
            }
        }
    }
}

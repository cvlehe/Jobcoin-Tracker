//
//  UserHelper.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import Foundation
import Alamofire

struct UserHelper {


    
    static func signIn (address:String, completion:@escaping (_ success:Bool, _ error:String?)->Void) {
        let url = Urls.addressInfo + address
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.isSuccess, let json = response.result.value as? [String:Any] {
                User.setCurrentUser(user: User(address: address, json: json))
                completion(true, nil)
            }else {
                completion(false, response.result.error.debugDescription)
            }
        }
    }
    
    static func signOut () {
        User.setCurrentUser(user: nil)
    }
}

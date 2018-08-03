//
//  Extensions.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import Foundation
import UIKit

//simple extension for showing alert controller
extension UIAlertController {
    static func showAlert (viewController:UIViewController, title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewController.present(alertController, animated: true, completion: nil)
    }
}

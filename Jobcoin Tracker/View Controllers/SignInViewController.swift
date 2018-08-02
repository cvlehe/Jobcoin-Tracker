//
//  SignInViewController.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        guard let address = addressTextField.text, !address.isEmpty else {
            UIAlertController.showAlert(viewController: self, title: "Jobcoin Address Required", message: "A jobcoin address is required to sign in. Please enter your address and try again.")
            return
        }
        
        activityIndicator.startAnimating()
        sender.isHidden = true
        UserHelper.signIn(address: address) { (success, error) in
            if success {
                MainViewController.display(viewController: self)
            }else if let e = error {
                UIAlertController.showAlert(viewController: self, title: "Error", message: e)
            }else {
                UIAlertController.showAlert(viewController: self, title: "Error", message: "There was an error signing in. Please try again.")
            }
            self.activityIndicator.stopAnimating()
            sender.isHidden = false
        }

    }
    

}

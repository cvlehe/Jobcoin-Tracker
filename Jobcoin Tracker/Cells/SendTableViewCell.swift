//
//  SendTableViewCell.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import UIKit

protocol SendCellDelegate {
    func sendButtonPressed (toTextField:UITextField?, amountTextField:UITextField?, completion:@escaping (_ success:Bool)->Void)
}

class SendTableViewCell: UITableViewCell {
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var delegate:SendCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        sendButton.layer.cornerRadius = 4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func sendButtonPressed(_ sender: UIButton) {
        //When send pressed, show activity indicator and hide send button
        sender.isHidden = true
        activityIndicator.startAnimating()
        
        //Let the main view know so it can process the request
        delegate?.sendButtonPressed(toTextField: toTextField, amountTextField: amountTextField, completion: { (success) in
            
            //Once the request is completed, reset the send cell
            sender.isHidden = false
            self.activityIndicator.stopAnimating()
            
            if success {
                self.toTextField.text = ""
                self.amountTextField.text = ""
            }
        })
    }
}

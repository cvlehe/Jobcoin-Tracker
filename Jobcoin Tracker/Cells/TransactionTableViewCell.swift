//
//  TransactionTableViewCell.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //Populate cell for transaction
    func populate (transaction:Transaction) {
        //If there is no value for from address, display (new) like it does in Jobcoin Viewer
        fromLabel.text = transaction.fromAddress != nil ? transaction.fromAddress : "(new)"
        
        //Set recipient's address and the amount for the transaction
        toLabel.text = transaction.toAddress
        amountLabel.text = "\(transaction.amount!)"
        
        //Set date of transaction
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm:ss a"
        dateLabel.text = dateFormatter.string(from: transaction.timestamp)
    }
}

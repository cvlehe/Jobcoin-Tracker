//
//  MainViewController.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @IBAction func signOutButtonPressed(_ sender: UIButton) {
        UserHelper.signOut()
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func display (viewController:UIViewController) {
        let nextVC = viewController.storyboard?.instantiateViewController(withIdentifier: ViewControllerIds.MainViewController)
        viewController.present(nextVC!, animated: true, completion: nil)
    }

}

extension MainViewController:UITableViewDelegate {
    
}

extension MainViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2:
            return 1
        case 3:
            return User.current().transactions.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.currentBalance) as! CurrentBalanceTableViewCell
            cell.populate()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.send) as! SendTableViewCell
            cell.delegate = self
            return cell

        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.graph) as! GraphTableViewCell
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.transaction) as! TransactionTableViewCell
            cell.populate(transaction: User.current().transactions[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 67
        case 1:
            return 85
        case 3:
            return 99
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        headerView.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9137254902, alpha: 1)
        let label = UILabel(frame: CGRect(x: 8, y: 10, width: 200, height: 20))
        let headers = ["Current Balance", "Send", "Stats", "Transactions"]
        label.text = headers[section]
        label.textColor = UIColor.darkGray
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension MainViewController:SendCellDelegate {
    func sendButtonPressed(toTextField: UITextField?, amountTextField: UITextField?, completion: @escaping (Bool) -> Void) {
        guard let toAddress = toTextField?.text, !toAddress.isEmpty else {
            UIAlertController.showAlert(viewController: self, title: "To Address Required", message: "An address to send to is required. Please enter the recipient's address and try again.")
            completion(false)
            return
        }
        
        guard let amountString = amountTextField?.text, !amountString.isEmpty, let amount = Float(amountString)  else {
            UIAlertController.showAlert(viewController: self, title: "Amount Required", message: "An amount to send to is required. Please enter the amount and try again.")
            completion(false)
            return
        }
        
        TransactionHelper.send(toAddress: toAddress, amount: amount) { (success, error) in
            if success {
                self.tableView.reloadData()
            }else if let e = error {
                UIAlertController.showAlert(viewController: self, title: "Error", message: e)
            }else {
                UIAlertController.showAlert(viewController: self, title: "Error", message: "There was an error signing in. Please try again.")
            }
            completion(success)
        }
        
    }
}

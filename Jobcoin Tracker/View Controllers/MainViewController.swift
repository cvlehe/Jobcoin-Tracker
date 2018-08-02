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
        
        print("User:",UserHelper.current(),"Address:",UserHelper.current().address, "Balance:",UserHelper.current().balance,"Transactions:",UserHelper.current().transactions)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2:
            return 1
        case 3:
            return UserHelper.current().transactions.count
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
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.graph) as! GraphTableViewCell
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.send) as! SendTableViewCell
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.transaction) as! TransactionTableViewCell
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 67
        default:
            return 0
        }
    }
}

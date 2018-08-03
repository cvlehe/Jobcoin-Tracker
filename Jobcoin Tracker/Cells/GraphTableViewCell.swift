//
//  GraphTableViewCell.swift
//  Jobcoin Tracker
//
//  Created by Charles von Lehe on 8/2/18.
//  Copyright © 2018 charlesvonlehe. All rights reserved.
//

import UIKit
import Charts

class GraphTableViewCell: UITableViewCell {
    @IBOutlet weak var barChartView: BarChartView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populate () {
        //Generate bar chart data entries
        var entries:[BarChartDataEntry] = []
        
        //Track balance over time by adding or subtracting transaction amounts based on the recipient address
        let transactions:[Transaction] = User.current().transactions.reversed()
        var balance:Float = 0
        for i in 0..<transactions.count {
            let currentTransaction = transactions[i]
            balance += currentTransaction.toAddress == User.current().address ? currentTransaction.amount : -currentTransaction.amount
            entries.append(BarChartDataEntry(x: Double(i), y: Double(balance)))
        }

        
        //Create set based on entries
        let barDataSet = BarChartDataSet(values: entries, label: "")
        
        //Set chart data
        barChartView.data = BarChartData(dataSet: barDataSet)
        
        //Remove description label and legend
        barChartView.chartDescription?.text = ""
        barChartView.legend.enabled = false
        barChartView.xAxis.drawLabelsEnabled = false
        barChartView.leftAxis.drawLabelsEnabled = false
        
        //Set x axis labels to the bottom
        barChartView.xAxis.labelPosition = .bottom
    }

}

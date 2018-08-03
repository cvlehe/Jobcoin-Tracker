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
        var entries:[BarChartDataEntry] = []
        let transactions:[Transaction] = User.current().transactions.reversed()
        for i in 0..<transactions.count {
            entries.append(BarChartDataEntry(x: Double(i), y: Double(transactions[i].amount)))
        }
        let barDataSet = BarChartDataSet(values: entries, label: "")
        barChartView.data = BarChartData(dataSet: barDataSet)
        barChartView.chartDescription?.text = ""
        barChartView.legend.enabled = false
        barChartView.xAxis.labelPosition = .bottom
    }

}

//
//  CurrencyCell.swift
//  CurrencyTracker
//
//  Created by Scarpz on 13/02/19.
//  Copyright © 2019 scarpz. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var sourceName: UILabel!
    @IBOutlet private weak var dolarValue: UILabel!
    @IBOutlet private weak var euroValue: UILabel!
    

    // MARK: - Methods
    func setup(_ currency: Currency) {
        self.sourceName.text = currency.sourceName
        self.dolarValue.text =  "R$ " + String(format: "%.3f", currency.dolarValue ?? 0)
        self.euroValue.text = "R$ " + String(format: "%.3f", currency.euroValue ?? 0)
    }
}

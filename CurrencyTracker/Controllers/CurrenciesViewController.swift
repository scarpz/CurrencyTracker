//
//  CurrenciesViewController.swift
//  CurrencyTracker
//
//  Created by Scarpz on 13/02/19.
//  Copyright © 2019 scarpz. All rights reserved.
//

import UIKit

class CurrenciesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    
    // MARK: - Properties
    let sources: Set<APISources> = [.awesomeAPI, .exchangeRatesAPI]
    var currencies: [Currency] = []
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupCurrenciesView()
        
        self.getAllCurrencies()
    }
    
    
    // MARK: - Methods
    private func setupCurrenciesView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func getAllCurrencies() {
        
        for source in self.sources {
            
            var currentCurrency = Currency(sourceName: source.description())
            
            CurrencyServices.getCurrency(for: .dollar, from: source) { currency, error in
                
                if let dollarCurrency = currency {
                    
                }
            }
            
            CurrencyServices.getCurrency(for: .euro, from: source) { currency, error in
                
            }
        }
        
    }
}


// MARK: - Table View Methods
extension CurrenciesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell") as! CurrencyCell
        cell.setup(self.currencies[indexPath.row])
        return cell
    }
}

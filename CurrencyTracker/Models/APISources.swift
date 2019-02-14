//
//  APISources.swift
//  CurrencyTracker
//
//  Created by Scarpz on 13/02/19.
//  Copyright © 2019 scarpz. All rights reserved.
//

import Foundation

enum APISources: String {
    case awesomeAPI
    case exchangeRatesAPI
    case coinAPI
    
    var description: String {
        switch self {
        case .awesomeAPI: return "Awesome API"
        case .exchangeRatesAPI: return "Exchange Rates API"
        case .coinAPI: return "Coin API"
        }
    }
}

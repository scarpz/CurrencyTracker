//
//  CurrencyType.swift
//  CurrencyTracker
//
//  Created by Scarpz on 13/02/19.
//  Copyright © 2019 scarpz. All rights reserved.
//

import Foundation

enum CurrencyType {
    case dollar
    case euro
    case real
    
    func short() -> String {
        switch self {
        case .dollar: return "USD"
        case .euro: return "EUR"
        case .real: return "BRL"
        }
    }
}

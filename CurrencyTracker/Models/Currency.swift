//
//  Currency.swift
//  CurrencyTracker
//
//  Created by Scarpz on 13/02/19.
//  Copyright © 2019 scarpz. All rights reserved.
//

import Foundation

struct Currency {
    var sourceName: String
    var dolar: CurrencyDetail?
    var euro: CurrencyDetail?
    
    init(sourceName: String) {
        self.sourceName = sourceName
    }
}

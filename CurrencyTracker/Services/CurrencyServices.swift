//
//  CurrencyServices.swift
//  CurrencyTracker
//
//  Created by Scarpz on 13/02/19.
//  Copyright © 2019 scarpz. All rights reserved.
//

import Foundation

class CurrencyServices {
    
    static func getCurrency(for type: CurrencyType, from source: APISources, completion: @escaping (_ response: Currency?, _ error: Error?) -> Void) {
        
        let real = CurrencyType.real.short()
        
        let stringURL: String
        
        switch source {
        case .awesomeAPI: stringURL = "https://economia.awesomeapi.com.br/json/list/\(type.short())-\(real)"
        case .exchangeRatesAPI: stringURL = "https://api.exchangeratesapi.io/latest?base=\(type.short())&symbols=\(real)"
        }
        
        let url = URL(string: stringURL)!
        
        Request.request(url: url, method: .get, headers: nil, body: nil) { data, error in
            if let data = data {
                
            }
        }
        
    }
}

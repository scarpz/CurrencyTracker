//
//  CurrencyServices.swift
//  CurrencyTracker
//
//  Created by Scarpz on 13/02/19.
//  Copyright © 2019 scarpz. All rights reserved.
//

import Foundation

class CurrencyServices {
    
    static func getCurrency(for type: CurrencyType, from source: APISources, completion: @escaping (_ response: CurrencyDetail?, _ error: Error?) -> Void) {
        
        let real = CurrencyType.real.short
        
        let stringURL: String
        
        switch source {
        case .awesomeAPI: stringURL = "https://economia.awesomeapi.com.br/json/list/\(type.short)-\(real)/1"
        case .exchangeRatesAPI: stringURL = "https://api.exchangeratesapi.io/latest?base=\(type.short)&symbols=\(real)"
        case .coinAPI: stringURL = "https://rest.coinapi.io/v1/exchangerate/\(type.short)/\(real)"
        }
        
        let url = URL(string: stringURL)!
        
        var header: [String : String] = [:]
        
        if source == .coinAPI {
            header["X-CoinAPI-Key"] = "126DBC89-FCE3-427F-84DA-4A38BC393D31"
        }
        
        Request.request(url: url, method: .get, headers: header, body: nil) { data, error in
            if let data = data {
                let currencyDetail = ParseManager.parseToCurrencyDetail(data: data, for: type, from: source)
                completion(currencyDetail, nil)
            } else {
                completion(nil, error!)
            }
        }
        
    }
}

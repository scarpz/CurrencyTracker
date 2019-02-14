//
//  ParseManager.swift
//  CurrencyTracker
//
//  Created by Scarpz on 14/02/19.
//  Copyright © 2019 scarpz. All rights reserved.
//

import Foundation

class ParseManager {
    
    static func parseToCurrencyDetail(data: Data, for type: CurrencyType, from source: APISources) -> CurrencyDetail {
        
        switch source {
        case .awesomeAPI:
            
            let jsonArray = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String : Any]]
            
            let json = jsonArray[0]
            
            let stringValue = json["high"] as! String
            
            let value = Double(stringValue)!
            
            return CurrencyDetail(type: type, value: value)
            
        case .exchangeRatesAPI:
            
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]
            
            let ratesJson = json["rates"] as! [String : Any]
            let value = ratesJson["BRL"] as! Double
            
            return CurrencyDetail(type: type, value: value)
        }
    }
    
}

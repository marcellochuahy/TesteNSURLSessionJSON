//
//  UILabel+formatCurrencyToBrazilianReal.swift
//  TesteNSURLSessionJSON
//
//  Created by Marcello Chuahy on 24/11/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func formatCurrencyToBrazilianReal(_ monetarySum: Double?) -> String {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        
        guard let monetarySum = monetarySum else {
            return "R$ 0,00"
        }
        
        if let monetarySumString = currencyFormatter.string(from: NSNumber(value: monetarySum)){
            return monetarySumString
        } else {
            return "R$ 0,00"
        }
        
    }
    
}

//
//  SummaryOfPayments.swift
//  TesteNSURLSessionJSON
//
//  Created by Marcello Chuahy on 23/11/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

class SummaryOfPayments {
    
    /// Pagamentos vencidos:
    var overduePayments: [PaymentClass] = []
    var quantityOfOverduePayments: Int?
    var monetarySumOfOverduePayments: Double?
    
    /// Pagamentos a vencer:
    var duePayments: [PaymentClass] = []
    var quantityOfDuePayments: Int?
    var monetarySumOfDuePayments: Double?
    
    /// Pagamentos excluídos:
    var excludedPayments: [PaymentClass] = []
    var quantityOfExcludedPayments: Int?
    var monetarySumOfExcludedPayments: Double?
    
    /// Totals:
    var totalQuantityOfPayments = 0
    
}

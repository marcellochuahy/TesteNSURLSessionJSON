//
//  DetailViewController.swift
//  TesteNSURLSessionJSON
//
//  Created by Marcello Chuahy on 23/11/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var titleString: String?
    var summaryOfPayments: SummaryOfPayments?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleString ?? ""
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch titleString{
        case "Pagamentos vencidos": return summaryOfPayments?.quantityOfOverduePayments ?? 0
        case "Pagamentos a vencer": return summaryOfPayments?.quantityOfDuePayments ?? 0
        case "Pagamentos excluídos": return summaryOfPayments?.quantityOfExcludedPayments ?? 0
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as! PaymentTableViewCell

        switch titleString{
        case "Pagamentos vencidos":
            cell.favoredLabel.text = summaryOfPayments!.overduePayments[indexPath.row].nomeBeneficiario
            cell.monetaryValueToPay.text = formatCurrencyToBrazilianReal(summaryOfPayments!.overduePayments[indexPath.row].valorPagar)
            cell.dateToPayLabel.text = summaryOfPayments!.overduePayments[indexPath.row].dataVencimento
        case "Pagamentos a vencer":
            cell.favoredLabel.text = summaryOfPayments!.duePayments[indexPath.row].nomeBeneficiario
            cell.monetaryValueToPay.text = formatCurrencyToBrazilianReal(summaryOfPayments!.duePayments[indexPath.row].valorPagar)
            cell.dateToPayLabel.text = summaryOfPayments!.duePayments[indexPath.row].dataVencimento
        case "Pagamentos excluídos":
            cell.favoredLabel.text = summaryOfPayments!.excludedPayments[indexPath.row].nomeBeneficiario
            cell.monetaryValueToPay.text = formatCurrencyToBrazilianReal(summaryOfPayments!.excludedPayments[indexPath.row].valorPagar)
            cell.dateToPayLabel.text = summaryOfPayments!.excludedPayments[indexPath.row].dataVencimento
        default: break
        }

        return cell
    }

}

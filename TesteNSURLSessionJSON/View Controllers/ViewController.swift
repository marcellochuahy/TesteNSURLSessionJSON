//
//  ViewController.swift
//  TesteNSURLSessionJSON
//
//  Created by Marcello Kantovitz Chuahy on 22/11/19.
//  Copyright © 2019 Marcello Kantovitz Chuahy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var summaryOfPayments = SummaryOfPayments()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    // MARK: - Methods
    func loadData() {
        
        guard let url = Bundle.main.url(forResource: "mockedJSONItau", withExtension: "json") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    
                    let rootJson = try JSONDecoder().decode(RootJsonPayments.self, from: data)
 
                    let statusCode = rootJson.statusCode
                    
                    if statusCode == 200 {
                        
                        self.summaryOfPayments.totalQuantityOfPayments = rootJson.data.pagination.total_elements

                        for item in rootJson.data.summary {
                            switch item.field {
                            case "total_cobranca_vencidos": self.summaryOfPayments.quantityOfOverduePayments = Int(item.value.field)
                            case "total_cobranca_a_vencer": self.summaryOfPayments.quantityOfDuePayments = Int(item.value.field)
                            case "total_cobranca_excluidos": self.summaryOfPayments.quantityOfExcludedPayments = Int(item.value.field)
                            case "valor_total_vencidos": self.summaryOfPayments.monetarySumOfOverduePayments = item.value.field
                            case "valor_total_a_vencer": self.summaryOfPayments.monetarySumOfDuePayments = item.value.field
                            case "valor_total_excluidos": self.summaryOfPayments.monetarySumOfExcludedPayments = item.value.field
                            default: break
                            }
                        }
                        
                        for pagamento in rootJson.data.payment {
                            
                            /// 1. Create an PaymentClass object
                            let payment = PaymentClass(
                                agenciaBeneficiario: pagamento.agenciaBeneficiario,
                                agenciaPagador: pagamento.agenciaPagador,
                                codigoBarra: pagamento.codigoBarra,
                                contaBeneficiario: pagamento.contaBeneficiario,
                                contaPagador: pagamento.contaPagador,
                                cpfCnpjBeneficiario: pagamento.cpfCnpjBeneficiario,
                                cpfCnpjPagador: pagamento.cpfCnpjPagador,
                                dacBeneficiario: pagamento.dacBeneficiario,
                                dacPagador: pagamento.dacPagador,
                                dataLimitePagamento: pagamento.dataLimitePagamento,
                                dataVencimento: pagamento.dataLimitePagamento,
                                descricaoInstituicaoEmissora: pagamento.descricaoInstituicaoEmissora,
                                idCobranca: pagamento.idCobranca,
                                nomeBeneficiario: pagamento.nomeBeneficiario,
                                nomePagador: pagamento.nomePagador,
                                observacaoBeneficiario: pagamento.observacaoBeneficiario,
                                pagamento: pagamento.pagamento,
                                tipoPessoaBeneficiario: pagamento.tipoPessoaBeneficiario,
                                tipoPessoaPagador: pagamento.tipoPessoaPagador,
                                valorDocumento: pagamento.valorDocumento,
                                valorPagar: pagamento.valorPagar
                            )
                            
                            /// 2. Append the above PaymentClass object to correspondent class of payment
                            if let status: DDAPaymentStatus = pagamento.status {
                                switch status {
                                case .VENCIDO: self.summaryOfPayments.overduePayments.append(payment)
                                case .A_VENCER: self.summaryOfPayments.duePayments.append(payment)
                                case .EXCLUIDO, .EXCUIDO_A_VENCER, .EXCLUIDO_A_VENCER, .EXCLUIDO_VENCIDO: self.summaryOfPayments.excludedPayments.append(payment)
                                }
                            }
   
                        }
                        
                    } else {
                        print("Error to conect API")
                    }

                    DispatchQueue.main.async { [weak self] in
                        self?.tableView.reloadData()
                    }
                    
                } catch let error {
                    print(error)
                }
                
            }
        }.resume()
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {


    
    // Mark: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var defaultTableViewCell = UITableViewCell()

        if indexPath.row == 0 {
            cell.textLabel?.text = "\(summaryOfPayments.quantityOfOverduePayments ?? 0) pagamentos vencidos"
            cell.detailTextLabel?.text = formatCurrencyToBrazilianReal(summaryOfPayments.monetarySumOfOverduePayments)
            defaultTableViewCell = cell
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "\(summaryOfPayments.quantityOfDuePayments ?? 0) pagamentos a vencer"
            cell.detailTextLabel?.text = formatCurrencyToBrazilianReal(summaryOfPayments.monetarySumOfDuePayments)
            defaultTableViewCell = cell
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "\(summaryOfPayments.quantityOfExcludedPayments ?? 0) pagamentos excluídos"
            cell.detailTextLabel?.text = formatCurrencyToBrazilianReal(summaryOfPayments.monetarySumOfExcludedPayments)
            defaultTableViewCell = cell
        } else {
            // Intencionally not implemmented
        }

        return defaultTableViewCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if summaryOfPayments.totalQuantityOfPayments < 1000 {
            return "exibindo \(summaryOfPayments.totalQuantityOfPayments) resultados:"
        } else {
            return "exibindo 1000 resultados de um total de \(summaryOfPayments.totalQuantityOfPayments)"
        }

    }
    
    // Mark: - Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueFromViewControllerToDetailViewController" {
            if let destinationViewController = segue.destination as? DetailViewController {
                let indexPath = self.tableView.indexPathForSelectedRow!
                
                switch indexPath.row {
                case 0:
                    destinationViewController.titleString = "Pagamentos vencidos"
                case 1:
                    destinationViewController.titleString = "Pagamentos a vencer"
                case 2:
                    destinationViewController.titleString = "Pagamentos excluídos"
                default:
                    break
                }
                
                destinationViewController.summaryOfPayments = self.summaryOfPayments
                
            }
        }
        
    }
    
}





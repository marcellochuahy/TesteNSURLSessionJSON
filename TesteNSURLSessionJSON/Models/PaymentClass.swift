//
//  PaymentClass.swift
//  TesteNSURLSessionJSON
//
//  Created by Marcello Chuahy on 23/11/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

class PaymentClass {
    
    let agenciaBeneficiario: String?
    let agenciaPagador: String?
    let codigoBarra: String?
    let contaBeneficiario: String?
    let contaPagador: String?
    let cpfCnpjBeneficiario: String
    let cpfCnpjPagador: String
    let dacBeneficiario: String?
    let dacPagador: String?
    let dataLimitePagamento: String
    let dataVencimento: String
    let descricaoInstituicaoEmissora: String
    let idCobranca: String
    let nomeBeneficiario: String
    let nomePagador: String
    let observacaoBeneficiario: String?
    let pagamento: Bool?
    let tipoPessoaBeneficiario: String
    let tipoPessoaPagador: String
    let valorDocumento: Double
    let valorPagar: Double
    
    init(
        agenciaBeneficiario: String?,
        agenciaPagador: String?,
        codigoBarra: String?,
        contaBeneficiario: String?,
        contaPagador: String?,
        cpfCnpjBeneficiario: String,
        cpfCnpjPagador: String,
        dacBeneficiario: String?,
        dacPagador: String?,
        dataLimitePagamento: String,
        dataVencimento: String,
        descricaoInstituicaoEmissora: String,
        idCobranca: String,
        nomeBeneficiario: String,
        nomePagador: String,
        observacaoBeneficiario: String?,
        pagamento: Bool?,
        tipoPessoaBeneficiario: String,
        tipoPessoaPagador: String,
        valorDocumento: Double,
        valorPagar: Double
    ) {
        self.agenciaBeneficiario = agenciaBeneficiario
        self.agenciaPagador = agenciaPagador
        self.codigoBarra = codigoBarra
        self.contaBeneficiario = contaBeneficiario
        self.contaPagador = contaPagador
        self.cpfCnpjBeneficiario = cpfCnpjBeneficiario
        self.cpfCnpjPagador = cpfCnpjPagador
        self.dacBeneficiario = dacBeneficiario
        self.dacPagador = dacPagador
        self.dataLimitePagamento = dataLimitePagamento
        self.dataVencimento = dataVencimento
        self.descricaoInstituicaoEmissora = descricaoInstituicaoEmissora
        self.idCobranca = idCobranca
        self.nomeBeneficiario = nomeBeneficiario
        self.nomePagador = nomePagador
        self.observacaoBeneficiario = observacaoBeneficiario
        self.pagamento = pagamento
        self.tipoPessoaBeneficiario = tipoPessoaBeneficiario
        self.tipoPessoaPagador = tipoPessoaPagador
        self.valorDocumento = valorDocumento
        self.valorPagar = valorPagar
    }
    
}


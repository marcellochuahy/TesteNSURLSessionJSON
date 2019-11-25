//
//  RootJsonPayments.swift
//  TesteNSURLSessionJSON
//
//  Created by Marcello Kantovitz Chuahy on 22/11/19.
//  Copyright © 2019 Marcello Kantovitz Chuahy. All rights reserved.
//

struct RootJsonPayments: Decodable {
    let data: Data
    let statusCode: Int
}

enum DDAPaymentStatus: String, Codable {
    case A_VENCER
    case VENCIDO
    case EXCLUIDO
    case EXCUIDO_A_VENCER
    case EXCLUIDO_A_VENCER
    case EXCLUIDO_VENCIDO
}

struct Data: Decodable {
    let payment: [Payment]
    let summary: [Summary]
    let pagination: Pagination
    
    enum CodingKeys: String, CodingKey {
        case payment = "data"
        case summary
        case pagination
    }
    
}

struct Payment: Decodable {
    

    
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
    let status: DDAPaymentStatus?
    let tipoPessoaBeneficiario: String
    let tipoPessoaPagador: String
    let valorDocumento: Double
    let valorPagar: Double
    
    enum CodingKeys: String, CodingKey {
        case agenciaBeneficiario = "agencia_beneficiario"
        case agenciaPagador = "agencia_pagador"
        case codigoBarra = "codigo_barra"
        case contaBeneficiario = "conta_beneficiario"
        case contaPagador = "conta_pagador"
        case cpfCnpjBeneficiario = "cpf_cnpj_beneficiario"
        case cpfCnpjPagador = "cpf_cnpj_pagador"
        case dacBeneficiario = "dac_beneficiario"
        case dacPagador = "dac_pagador"
        case dataLimitePagamento = "data_limite_pagamento"
        case dataVencimento = "data_vencimento"
        case descricaoInstituicaoEmissora = "descricao_instituicao_emissora"
        case idCobranca = "id_cobranca"
        case nomeBeneficiario = "nome_beneficiario"
        case nomePagador = "nome_pagador"
        case observacaoBeneficiario = "observacao_beneficiario"
        case pagamento = "pagamento"
        case status = "status"
        case tipoPessoaBeneficiario = "tipo_pessoa_beneficiario"
        case tipoPessoaPagador = "tipo_pessoa_pagador"
        case valorDocumento = "valor_documento"
        case valorPagar = "valor_a_pagar"
    }
   
}

struct Summary: Decodable {
    let field: String
    let value: Value
}

struct Pagination: Decodable {
    let page: String
    let total_pages: Int
    let total_elements: Int
    let page_size: Int
}

struct Value: Decodable {
    let field: Double
    let unity: String
}

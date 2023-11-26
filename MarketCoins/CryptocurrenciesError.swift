//
//  CryptocurrenciesError.swift
//  MarketCoins
//
//  Created by Willian Peres on 22/11/23.
//

import Foundation

enum CryptocurrenciesError: Error {
    case internalServerError
    case badRequestError
    case notFoundError
    case tooManyRequests
    case undefinedError

    var errorDescription: String {
        switch self {
        case .internalServerError:
            return "Ocorreu um erro no servidor."
        case .badRequestError:
            return "Sua requisição não foi bem sucedida."
        case .notFoundError:
            return "O serviço que você está buscando não existe."
        case .tooManyRequests:
            return "Limite de requisições atingido."
        case .undefinedError:
            return "Ocorreu um erro inesperado."
        }
    }
}


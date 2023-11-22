//
//  CoinsRouter.swift
//  MarketCoins
//
//  Created by Willian Peres on 20/11/23.
//

import Foundation

enum CoinsRouter {
    case coinsMarkets(currency: String, cryptocurrency: [String]?, order: String, perPage: Int, page: Int, percentage: String)
    case coinsByIdMarketChart(id: String, currency: String, from: String, to: String)
    case coinsByIdOhlc(id: String, currency: String, days: String)
    case coinsById(id: String)
    
    var path: String {
        switch self {
        case .coinsMarkets:
            return API.coinsMarkets
        case .coinsByIdMarketChart(let id, _, _, _):
            return String(format: API.coinsByIdMarketChart, id)
        case .coinsByIdOhlc(let id, _, _):
            return String(format: API.coinsByIdOhlc, id)
        case .coinsById(let id):
            return String(format: API.coinsById, id)
        }
    }
    
    func asURLRequest() throws -> URL? {
        guard let url = URL(string: API.baseURL) else { return nil }
        
        switch self {
        case .coinsMarkets(let currency, let cryptocurrency, let order, let perPage, let page, let percentage):
            var parameters: [String: String] = [
                "vs_currency": currency,
                "order": order,
                "per_page": String(perPage),
                "page": String(page),
                "sparkline": String(false),
                "price_change_percentage": percentage
            ]
                
            if let cryptocurrency {
                parameters["ids"] = cryptocurrency.joined(separator: ",")
            }
                
            return url.appendingQueryParameters(path: path, parameters: parameters)
                
        case .coinsByIdMarketChart(_, let currency, let from, let to):
            let parameters: [String: String] = [
                "vs_currency": currency,
                "from": from,
                "to": to
            ]
                
            return url.appendingQueryParameters(path: path, parameters: parameters)
                
        case .coinsByIdOhlc(_, let currency, let days):
            let parameters: [String: String] = [
                "vs_currency": currency,
                "days": days
            ]
                
            return url.appendingQueryParameters(path: path, parameters: parameters)
                
        case .coinsById:
            let parameters: [String: String] = [
                "localization": String(false),
                "ticketers": String(false),
                "market_data": String(true),
                "community_data": String(false),
                "developer_data": String(false),
                "sparkline": String(false)
            ]
                
            return url.appendingQueryParameters(path: path, parameters: parameters)
        }
    }
}

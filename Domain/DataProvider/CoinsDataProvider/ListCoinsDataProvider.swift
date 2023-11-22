//
//  ListCoinsDataProvider.swift
//  MarketCoins
//
//  Created by Willian Peres on 20/11/23.
//

import Foundation

protocol ListCoinsDataProviderDelegate: GenericDataProviderDelegate {}

class ListCoinsDataProvider: GenericDataProviderManager<ListCoinsDataProviderDelegate, [CoinModel]> {
    private let coinsStore: CoinsStoreProtocol?
    
    init(coinsStore: CoinsStoreProtocol = CoinsStore()) {
        self.coinsStore = coinsStore
    }
    
    func fetchListCoins(by vsCurrency: String, with cryptocurrency: [String]?, orderBy order: String, total perPage: Int, page: Int, percentagePrice: String) {
        coinsStore?.fetchListCoins(by: vsCurrency, with: cryptocurrency, orderBy: order, total: perPage, page: page, percentagePrice: percentagePrice, completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.success(model: result)
            }
        })
    }
}

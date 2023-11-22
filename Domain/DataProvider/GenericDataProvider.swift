//
//  GenericDataProvider.swift
//  MarketCoins
//
//  Created by Willian Peres on 20/11/23.
//

import Foundation

protocol GenericDataProviderDelegate {
    func success(model: Any)
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error)
}

class GenericDataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}

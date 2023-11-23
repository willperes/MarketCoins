//
//  GlobalValuesWorker.swift
//  MarketCoins
//
//  Created by Willian Peres on 22/11/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class GlobalValuesWorker {
    private let dataProvider: GlobalValuesDataProvider?
    private var completion: ((Result<GlobalModel?, CryptocurrenciesError>) -> Void)?
    
    init(dataProvider: GlobalValuesDataProvider = GlobalValuesDataProvider()) {
        self.dataProvider = dataProvider
        self.dataProvider?.delegate = self
    }
    
    func doFetchGlobalValues(completion: @escaping ((Result<GlobalModel?, CryptocurrenciesError>) -> Void)) {
        dataProvider?.fetchGlobalValues()
        self.completion = completion
    }
}

extension GlobalValuesWorker: GlobalValuesDataProviderDelegate {
    func success(model: Any) {
        guard let completion = completion else {
            fatalError("GlobalValuesWorker: Completion not implemented")
        }
        
        completion(.success(model as? GlobalModel))
    }
    
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error) {
        guard let completion = completion else {
            fatalError("GlobalValuesWorker: Completion not implemented")
        }
        
        if error.errorCode == 500 {
            completion(.failure(.internalServerError))
        } else if error.errorCode == 400 {
            completion(.failure(.badRequestError))
        } else if error.errorCode == 404 {
            completion(.failure(.notFoundError))
        } else {
            completion(.failure(.undefinedError))
        }
    }
}

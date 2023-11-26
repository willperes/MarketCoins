//
//  CoinHeaderView.swift
//  MarketCoins
//
//  Created by Willian Peres on 23/11/23.
//

import UIKit

class CoinHeaderView: UITableViewHeaderFooterView {
    static let identifier = "CoinHeaderView"
    
    @IBOutlet weak var priceChangePercentualLabel: UILabel!
    
    func setupPriceChangePercentage(from filter: Filter) {
        if filter.type == .priceChangePercentage {
            if let priceChangePercentageFilter = PriceChangePercentageFilterEnum(rawValue: filter.key) {
                priceChangePercentualLabel.text = priceChangePercentageFilter.title
            }
        }
    }
}

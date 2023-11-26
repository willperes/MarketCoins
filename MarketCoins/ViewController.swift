//
//  ViewController.swift
//  MarketCoins
//
//  Created by Willian Peres on 20/11/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        preconditionFailure("This method must be implemented")
    }
    
    func showError(for message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in
            exit(0)
        }))
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: handler))
        
        present(alert, animated: true)
    }
}

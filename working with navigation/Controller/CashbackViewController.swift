//
//  CashbackViewController.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 24/03/23.
//

import UIKit

class CashbackViewController: UIViewController {
    var cashbackCollectionView = CashbackCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        cashbackCollectionView.set(cell: Cashback.fetch())
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(cashbackCollectionView)
        
        NSLayoutConstraint.activate([
            cashbackCollectionView.heightAnchor.constraint(equalToConstant: view.frame.size.height),
            cashbackCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        
        
        ])
    }
}

//
//  SubsCollectionView.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 23/03/23.
//

import UIKit

class SubsCollectionView: UICollectionView {

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        register(SubsCollectionViewCell.self, forCellWithReuseIdentifier: SubsCollectionViewCell.identifier)
        layout.minimumLineSpacing = 0
        contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  GalleryCollectionView.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 20/03/23.
//

import UIKit

class GalleryCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier:GalleryCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

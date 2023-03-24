//
//  ThirdCollectionView.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 21/03/23.
//

import UIKit

class ThirdCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var cells = [ModelCards] ()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        layout.minimumLineSpacing = 16
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        register(ThirdCollectionViewCell.self, forCellWithReuseIdentifier:ThirdCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func set(cell: [ModelCards]) {
        self.cells = cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.reuseId, for: indexPath) as! ThirdCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].image
        cell.title.text = cells[indexPath.row].title
        cell.subTitle.text = cells[indexPath.row].subtitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 32, height: 90)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


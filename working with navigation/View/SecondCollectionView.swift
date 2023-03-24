//
//  SecondCollectionView.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 21/03/23.
//

import UIKit

class SecondCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   // var cells = [Model] ()
    var data = [Service]()
    var navigationController: UINavigationController
    var totalPrice: Int = 0
    var cells = [Model]()
   

    
    init(nav: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.navigationController = nav as! UINavigationController
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        layout.minimumLineSpacing = 16
        showsHorizontalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        register(SecondCollectionViewCell.self, forCellWithReuseIdentifier:SecondCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    func set(cell: [Model]) {
        self.cells = cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.reuseId, for: indexPath) as! SecondCollectionViewCell
        cell.title.text = cells[indexPath.row].title
        cell.subTitle.text = cells[indexPath.row].subtitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2 * 0.88, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = HistoryViewController()
            vc.title = "Все операции"
            navigationController.pushViewController(vc, animated: true)
        }
        else {
            let vc = CashbackViewController()
            vc.title = "Кэшбэки и бонусы"
            navigationController.pushViewController(vc, animated: true)
        }
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

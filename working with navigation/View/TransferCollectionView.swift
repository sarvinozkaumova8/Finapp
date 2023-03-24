//
//  TransferCollectionView.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 22/03/23.
//

import UIKit

class TransferCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    var contacts = [Contacts]()
    var navigationController: UINavigationController

    init(nav: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.navigationController = nav as! UINavigationController
        super.init(frame: .zero, collectionViewLayout: layout)
        register(PaymentsCollectionViewCell.self, forCellWithReuseIdentifier: PaymentsCollectionViewCell.identifier)
        layout.minimumLineSpacing = 16
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        delegate = self
        dataSource = self
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(cell: [Contacts]) {
        self.contacts = cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension TransferCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: PaymentsCollectionViewCell.identifier, for: indexPath) as! PaymentsCollectionViewCell
        cell.image.backgroundColor = UIColor.systemGray5
        cell.title.text = contacts[indexPath.row].name
        cell.symbol.text = contacts[indexPath.row].symbol
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PaymentsViewController()
        vc.textfield.text = "  \(contacts[indexPath.row].number)"
        vc.title = contacts[indexPath.row].name
        navigationController.pushViewController(vc, animated: true)
    }
}

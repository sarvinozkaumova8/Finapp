//
//  SecondViewController.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 19/03/23.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    var subs: [Subs]?
    var subsCollectionView = SubsCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        subsCollectionView.delegate = self
        subsCollectionView.dataSource = self
        print(subs, "subs")
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(subsCollectionView)
        
        NSLayoutConstraint.activate([
            subsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            subsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            subsCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        ])
    }
}
extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubsCollectionViewCell.identifier, for: indexPath) as! SubsCollectionViewCell
        cell.title.text = subs?[indexPath.row].name ?? ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
        let vc = PaymentsViewController()
        vc.category = title ?? ""
        vc.title = subs?[indexPath.row].name ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
}

//
//  MainViewController.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 20/03/23.
//

import UIKit

class MainViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegateFlowLayout {
    private var galleryCollectionView = GalleryCollectionView()
    private var secondCollectionView: SecondCollectionView!
    private var thirdCollectionView = ThirdCollectionView()
    var searchController = UISearchController()
    var cells = [SushiModel] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Sarvinoz"
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        secondCollectionView = SecondCollectionView(nav: self.navigationController!)
        secondCollectionView.set(cell: Model.fetchModel())
        thirdCollectionView.set(cell: ModelCards.fetchModelCards())
        setup()
        configureConstraints()
        set(cell: SushiModel.fetchsushi())
    }
    
    func set(cell: [SushiModel]) {
        self.cells = cell
    }
    
    func setup() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Операции"
    }

    func configureConstraints() {
        view.addSubview(galleryCollectionView)
        view.addSubview(secondCollectionView)
        view.addSubview(thirdCollectionView)
        galleryCollectionView.backgroundColor = .systemGray6
        secondCollectionView.backgroundColor = .systemGray6
        thirdCollectionView.backgroundColor = .systemGray6
        
        NSLayoutConstraint.activate([
            galleryCollectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            galleryCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            galleryCollectionView.heightAnchor.constraint(equalToConstant: 140),
            
            secondCollectionView.topAnchor.constraint(equalTo: galleryCollectionView.bottomAnchor),
            secondCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            secondCollectionView.heightAnchor.constraint(equalToConstant: 150),
            
            thirdCollectionView.topAnchor.constraint(equalTo: secondCollectionView.bottomAnchor, constant: 10),
            thirdCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            thirdCollectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
            
        ])
    }
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        cell.title.text = cells[indexPath.row].sushiName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.image.image = cells[indexPath.row].imageDetail
        present(vc, animated: false)
    }
}

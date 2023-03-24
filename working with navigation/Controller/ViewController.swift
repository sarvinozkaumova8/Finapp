//
//  ViewController.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 18/03/23.
//

import UIKit

class ViewController: UIViewController {
    let searchController = UISearchController()
    var favoritesCollectionView: FavoritesCollectionView!
    var transferCollectionView: TransferCollectionView!
    var servicesCollectionView: ServicesCollectionView!
    var network = NetworkService()
    
    lazy var sectionOne: UILabel = {
        let label = UILabel()
        label.text = "Избранное"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sectionTwo: UILabel = {
        let label = UILabel()
        label.text = "Переводы по телефону"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sectionThree: UILabel = {
        let label = UILabel()
        label.text = "Услуги"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var  prefix: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.sizeToFit()
        return label
    }()
    
    lazy var phoneTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   Введите номер или имя"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.returnKeyType = .next
        textField.textColor = .black
        textField.backgroundColor = .systemGray6
        textField.leftViewMode = .always
        textField.leftView = prefix
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.cornerRadius = 16
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        transferCollectionView = TransferCollectionView(nav: self.navigationController!)
        servicesCollectionView = ServicesCollectionView(nav: self.navigationController!)
        favoritesCollectionView = FavoritesCollectionView(nav: self.navigationController!)
        transferCollectionView.set(cell: Contacts.fetchContacts())
        setup()
        fetchData()
        configureConstraint()
    }
    
    func configureConstraint() {
        view.addSubview(sectionOne)
        view.addSubview(favoritesCollectionView)
        view.addSubview(sectionTwo)
        view.addSubview(phoneTextfield)
        view.addSubview(sectionThree)
        view.addSubview(transferCollectionView)
        view.addSubview(servicesCollectionView)
        
        NSLayoutConstraint.activate([
            sectionOne.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            sectionOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            favoritesCollectionView.topAnchor.constraint(equalTo: sectionOne.bottomAnchor),
            favoritesCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            favoritesCollectionView.heightAnchor.constraint(equalToConstant: 120),
            
            sectionTwo.topAnchor.constraint(equalTo: favoritesCollectionView.bottomAnchor, constant: 10),
            sectionTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            phoneTextfield.topAnchor.constraint(equalTo: sectionTwo.bottomAnchor, constant: 16),
            phoneTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            phoneTextfield.heightAnchor.constraint(equalToConstant: 45),
            
            transferCollectionView.topAnchor.constraint(equalTo: phoneTextfield.bottomAnchor),
            transferCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            transferCollectionView.heightAnchor.constraint(equalToConstant: 120),
            
            sectionThree.topAnchor.constraint(equalTo: transferCollectionView.bottomAnchor, constant: 10),
            sectionThree.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            servicesCollectionView.topAnchor.constraint(equalTo: sectionThree.bottomAnchor),
            servicesCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            servicesCollectionView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    func setup() {
        navigationItem.title = "Платежи"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "ЖКХ"
        searchController.searchBar.delegate = self
    }
    
    func fetchData(){
        let urlString = "https://641bfd449b82ded29d5d3b01.mockapi.io/pay"
        self.network.fetchData(urlString: urlString) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.servicesCollectionView.services = response
                print(urlString)
                print(response)
                self.servicesCollectionView.reloadData()
            case .failure(let error):
                print(urlString, "url")
                print("error", error)
            }
        }
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("clicked")
    }
}


  


          
            
            
            
        
       

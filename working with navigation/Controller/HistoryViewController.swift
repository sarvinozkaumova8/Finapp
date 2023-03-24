//
//  HistoryViewController.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 24/03/23.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {
    var historyCollectionView = HistoryCollectionView()
    var service = [Service]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticles()
        configureConstraints()
    }
    
    func configureConstraints() {
        view.addSubview(historyCollectionView)
        
        NSLayoutConstraint.activate([
            historyCollectionView.heightAnchor.constraint(equalToConstant: view.frame.size.height),
            historyCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        
        
        ])
    }
    
    func loadArticles() {
        navigationItem.largeTitleDisplayMode = .never
        let request: NSFetchRequest <Service> = Service.fetchRequest()
        do {
            service = try context.fetch(request)
            historyCollectionView.data = service
            historyCollectionView.reloadData()
        }catch {
            print("Error fetching data from context \(error)")
        }
    }
}

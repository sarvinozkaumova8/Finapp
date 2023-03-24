//
//  HistoryCollectionViewCell.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 24/03/23.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "HistoryCollectionViewCell"
    
    lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = .blue
        icon.layer.cornerRadius = 10
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var service: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(red: 0.929, green: 0.93, blue: 1, alpha: 1).cgColor
    }
    
    func configureConstraints() {
        contentView.addSubview(service)
        contentView.addSubview(icon)
        contentView.addSubview(price)
        
        NSLayoutConstraint.activate([
            
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalToConstant: 20),
            
            service.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            service.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            
            price.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

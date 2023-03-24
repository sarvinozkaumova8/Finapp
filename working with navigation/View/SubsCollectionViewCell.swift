//
//  SubsCollectionViewCell.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 23/03/23.
//

import UIKit

class SubsCollectionViewCell: UICollectionViewCell {
    static let identifier = "SubsCollectionViewCell"
    
    lazy var title: UILabel = {
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
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

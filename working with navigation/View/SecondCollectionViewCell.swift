//
//  SecondCollectionViewCell.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 21/03/23.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    static let reuseId = "SecondCollectionViewCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let title: UILabel = {
    let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let subTitle: UILabel = {
    let subTitle = UILabel()
        subTitle.numberOfLines = 0
        subTitle.textAlignment = .left
        subTitle.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }()
    
    override init (frame: CGRect) {
        super.init (frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true

        contentView.addSubview(title)
        contentView.addSubview(subTitle)

        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        
        subTitle.leadingAnchor.constraint(equalTo:
        contentView.leadingAnchor, constant: 10).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5).isActive = true
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true 
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been i mplemented")
    }
}

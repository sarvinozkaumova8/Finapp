//
//  ThirdCollectionViewCell.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 21/03/23.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {
    static let reuseId = "ThirdCollectionViewCell"
    
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
        title.font = UIFont.systemFont(ofSize: 14, weight: .bold)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        configureConstraints()
    }
    
    func configureConstraints() {
        contentView.addSubview(mainImageView)
        contentView.addSubview(title)
        contentView.addSubview(subTitle)
        
        NSLayoutConstraint.activate([
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 50),
            mainImageView.widthAnchor.constraint(equalToConstant: 50),
            
            title.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            title.topAnchor.constraint(equalTo:mainImageView.topAnchor),
            
            subTitle.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10),
            subTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been i mplemented")
    }
}

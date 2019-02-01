//
//  BannerTableViewCell.swift
//  SignIn
//
//  Created by Lucy Xu on 1/30/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
    
    var bannerImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bannerImageView = UIImageView()
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        bannerImageView.contentMode = .scaleAspectFill
        bannerImageView.layer.cornerRadius = 10
        bannerImageView.clipsToBounds = true
        
        contentView.backgroundColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        contentView.addSubview(bannerImageView)
        
        updateConstraints()
    }
 
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
        
        super.updateConstraints()
    }
    
    func configure(image: String) {
        bannerImageView.image = UIImage(named: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

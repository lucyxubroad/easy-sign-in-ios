//
//  AttendeeCollectionViewCell.swift
//  SignIn
//
//  Created by Lucy Xu on 1/31/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit

class AttendeeCollectionViewCell: UICollectionViewCell {
    
    var userImageView: UIImageView!
    var userNameLabel: UILabel!
    var userEmailLabel: UILabel!
    var userContainerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        userContainerView = UIView()
        userContainerView.translatesAutoresizingMaskIntoConstraints = false
        userContainerView.layer.cornerRadius = 5
        userContainerView.layer.borderWidth = 0.5
        userContainerView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        
        userImageView = UIImageView()
        userImageView.image = UIImage(named: "user-image")
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.contentMode = .scaleAspectFit
        userImageView.clipsToBounds = true
        
        userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        userNameLabel.lineBreakMode = .byWordWrapping
        userNameLabel.textAlignment = .center
        userNameLabel.numberOfLines = 0
        
        userEmailLabel = UILabel()
        userEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        userEmailLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        userEmailLabel.lineBreakMode = .byWordWrapping
        userEmailLabel.textAlignment = .center
        userEmailLabel.numberOfLines = 0
        
        userContainerView.addSubview(userImageView)
        userContainerView.addSubview(userNameLabel)
        userContainerView.addSubview(userEmailLabel)
        contentView.addSubview(userContainerView)
        
        updateConstraints()
        
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            userContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            userContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            userContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            userContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            ])
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: userContainerView.topAnchor, constant: 5),
            userImageView.leadingAnchor.constraint(equalTo: userContainerView.leadingAnchor),
            userImageView.trailingAnchor.constraint(equalTo: userContainerView.trailingAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: 50),
            userImageView.widthAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 5),
            userNameLabel.leadingAnchor.constraint(equalTo: userContainerView.leadingAnchor, constant: 3),
            userNameLabel.trailingAnchor.constraint(equalTo: userContainerView.trailingAnchor, constant: -3),
            userEmailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            userEmailLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userEmailLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor)
            ])
    }
    
    func configure(with user: User) {
        userNameLabel.text = "\(user.first_name) \(user.last_name)"
        userEmailLabel.text = user.email
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

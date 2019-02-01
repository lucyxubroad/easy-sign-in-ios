//
//  AttendeeTableViewCell.swift
//  SignIn
//
//  Created by Lucy Xu on 1/30/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit

class AttendeeTableViewCell: UITableViewCell {

    var userLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        userLabel = UILabel()
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.textColor = .black
        userLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        
        contentView.addSubview(userLabel)
        
        updateConstraints()
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            userLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            ])
        
        super.updateConstraints()
    }
    
    func configure(for user: User) {
        userLabel.text = "\(user.first_name) \(user.last_name)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

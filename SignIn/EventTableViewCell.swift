//
//  EventTableViewCell.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    var eventWrapper: UIView!
    var eventLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        
        eventWrapper = UIView()
        eventWrapper.translatesAutoresizingMaskIntoConstraints = false
        eventWrapper.backgroundColor = UIColor(red: 156/255, green: 192/255, blue: 241/255, alpha: 1)
        eventWrapper.layer.cornerRadius = 10
        
        eventLabel = UILabel()
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        eventLabel.textColor = .black
        eventLabel.font = UIFont.systemFont(ofSize: 14)
        
        eventWrapper.addSubview(eventLabel)
        contentView.addSubview(eventWrapper)
        
        updateConstraints()
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            eventWrapper.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            eventWrapper.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            eventWrapper.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            eventWrapper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
            ])
        
        NSLayoutConstraint.activate([
            eventLabel.topAnchor.constraint(equalTo: eventWrapper.topAnchor, constant: 15),
            eventLabel.leadingAnchor.constraint(equalTo: eventWrapper.leadingAnchor, constant: 15)
            ])
        
        super.updateConstraints()
    }

    
    func configure(for event: Event) {
        eventLabel.text = event.event
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


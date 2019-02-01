//
//  EventTableViewCell.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    var eventLabel: UILabel!
    var clubLabel: UILabel!
    var locationLabel: UILabel!
    var eventContainerView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        eventContainerView = UIView()
        eventContainerView.translatesAutoresizingMaskIntoConstraints = false
        eventContainerView.layer.cornerRadius = 5
        eventContainerView.layer.borderWidth = 0.5
        eventContainerView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        
        eventLabel = UILabel()
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        eventLabel.textColor = .black
        eventLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.textColor = .gray
        locationLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        
        clubLabel = UILabel()
        clubLabel.translatesAutoresizingMaskIntoConstraints = false
        clubLabel.textColor = .gray
        clubLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        
        eventContainerView.addSubview(eventLabel)
        eventContainerView.addSubview(locationLabel)
        eventContainerView.addSubview(clubLabel)
        
//        contentView.backgroundColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        contentView.addSubview(eventContainerView)
        
        updateConstraints()
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            eventLabel.topAnchor.constraint(equalTo: eventContainerView.topAnchor, constant: 15),
            eventLabel.leadingAnchor.constraint(equalTo: eventContainerView.leadingAnchor, constant: 15),
            clubLabel.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 10),
            clubLabel.leadingAnchor.constraint(equalTo: eventLabel.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: eventLabel.topAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: eventContainerView.trailingAnchor, constant: -15)
            ])
        
        NSLayoutConstraint.activate([
            eventContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            eventContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            eventContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
        
        super.updateConstraints()
    }

    
    func configure(for event: Event) {
        eventLabel.text = event.event
        clubLabel.text = event.club
        locationLabel.text = event.location
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


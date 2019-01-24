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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
        
        contentView.addSubview(eventLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(clubLabel)
        
        updateConstraints()
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            eventLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            eventLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            clubLabel.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 10),
            clubLabel.leadingAnchor.constraint(equalTo: eventLabel.leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: eventLabel.topAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
            ])
        
        super.updateConstraints()
    }

    
    func configure(for event: Event) {
        eventLabel.text = event.event
        clubLabel.text = event.club
        locationLabel.text = "\(event.building), \(event.room)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//
//  SignInPopUpUIView.swift
//  SignIn
//
//  Created by Lucy Xu on 1/30/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit

protocol PopUpDelegate {
    func handleDismissal()
}

class SignInPopUpUIView: UIView {
    
    var delegate: PopUpDelegate?
    
    var statusImageView: UIImageView!
    var cancelSignInButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        
        statusImageView = UIImageView()
        statusImageView.translatesAutoresizingMaskIntoConstraints = false
        statusImageView.image = UIImage(named: "success")
        addSubview(statusImageView)
        
        cancelSignInButton = UIButton()
        cancelSignInButton.translatesAutoresizingMaskIntoConstraints = false
        cancelSignInButton.setTitle("Cancel", for: .normal)
        cancelSignInButton.layer.cornerRadius = 5
        cancelSignInButton.backgroundColor = .white
        cancelSignInButton.setTitleColor(UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1), for: .normal)
        cancelSignInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        cancelSignInButton.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        addSubview(cancelSignInButton)
        
        setUpConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            statusImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            statusImageView.heightAnchor.constraint(equalToConstant: 100),
            statusImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            cancelSignInButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            cancelSignInButton.heightAnchor.constraint(equalToConstant: 30),
            cancelSignInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            cancelSignInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
            ])
    }
    
    @objc func dismissPopUp() {
        
    }
    
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }

}

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
    var successMessageLabel: UILabel!
    var successLabel: UILabel!
    var cancelSignInButton: UIButton!


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
        
        statusImageView = UIImageView()
        statusImageView.translatesAutoresizingMaskIntoConstraints = false
        statusImageView.image = UIImage(named: "authenticate-success")
        addSubview(statusImageView)
        
        successLabel = UILabel()
        successLabel.translatesAutoresizingMaskIntoConstraints = false
        successLabel.text = "SUCCESS!"
        successLabel.textColor = UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1)
        successLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        successMessageLabel = UILabel()
        successMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        successMessageLabel.textColor = UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1)
        successMessageLabel.text = "Your sign in has been recorded! Enjoy your meeting!"
        successMessageLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        successMessageLabel.numberOfLines = 2
        successMessageLabel.textAlignment = .center
        
        addSubview(successLabel)
        addSubview(successMessageLabel)
        
        cancelSignInButton = UIButton()
        cancelSignInButton.translatesAutoresizingMaskIntoConstraints = false
        cancelSignInButton.setTitle("Sounds Good!", for: .normal)
        cancelSignInButton.layer.cornerRadius = 25
        cancelSignInButton.backgroundColor = UIColor(red: 87/255, green: 206/255, blue: 169/255, alpha: 1)
        cancelSignInButton.setTitleColor(.white, for: .normal)
        cancelSignInButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
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
            statusImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            statusImageView.heightAnchor.constraint(equalToConstant: 75),
            statusImageView.widthAnchor.constraint(equalToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            successLabel.topAnchor.constraint(equalTo: statusImageView.bottomAnchor, constant: 25),
            successLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            successMessageLabel.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 20),
            successMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            successMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ])
        
        NSLayoutConstraint.activate([
            cancelSignInButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            cancelSignInButton.heightAnchor.constraint(equalToConstant: 45),
            cancelSignInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            cancelSignInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
            ])
    }
    
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }

}

//if (success) {
//    statusImageView.image = UIImage(named: "authenticate-success")
//    successLabel.text = "SUCCESS!"
//    successMessageLabel.text = "Your sign in has been recorded! Enjoy your meeting!"
//    cancelSignInButton.setTitle("Sounds Good!", for: .normal)
//    cancelSignInButton.backgroundColor = UIColor(red: 87/255, green: 206/255, blue: 169/255, alpha: 1)
//} else {
//    statusImageView.image = UIImage(named: "authenticate-fail")
//    successLabel.text = "OOPS!"
//    successMessageLabel.text = "We can't seem to verify your identity! Try again?"
//    cancelSignInButton.setTitle("Sure thing!", for: .normal)
//    cancelSignInButton.backgroundColor = UIColor(red: 254/255, green: 231/255, blue: 171/255, alpha: 1)
//}

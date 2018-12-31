//
//  ViewController.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var headerView: UIView!
    var logoImageView: UIImageView!
    var logoLabel: UILabel!
    var taglineLable: UILabel!
    var signInButton: UIButton!
    
    let blue = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        
        headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "logo-white")
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
        
        logoLabel = UILabel()
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.text = "Sign In!"
        logoLabel.textColor = UIColor(red: 252/255, green: 252/255, blue: 254/255, alpha: 1)
        logoLabel.font = UIFont.systemFont(ofSize: 24)
        
        taglineLable = UILabel()
        taglineLable.translatesAutoresizingMaskIntoConstraints = false
        taglineLable.text = "signing in made easier"
        taglineLable.textColor = UIColor(red: 252/255, green: 252/255, blue: 254/255, alpha: 1)
        taglineLable.font = UIFont.systemFont(ofSize: 15)
        
        view.addSubview(headerView)
        headerView.addSubview(logoImageView)
        headerView.addSubview(logoLabel)
        headerView.addSubview(taglineLable)
        
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In with Google", for: .normal)
        signInButton.layer.cornerRadius = 5
        signInButton.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 254/255, alpha: 1)
        signInButton.setTitleColor(blue, for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        
        view.addSubview(signInButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            headerView.widthAnchor.constraint(equalToConstant: width/2)
            ])
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
            logoImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor)
            ])

        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 5),
            logoLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 60)
            ])

        NSLayoutConstraint.activate([
            taglineLable.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 20),
            taglineLable.bottomAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 15)
            ])
        
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            signInButton.widthAnchor.constraint(equalToConstant: 300)
            ])
    }
    
    @objc func signIn() {
        let eventsTabBarViewController = EventsTabBarViewController()
        navigationController?.pushViewController(eventsTabBarViewController, animated: true)
    }

}


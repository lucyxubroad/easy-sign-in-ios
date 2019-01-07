//
//  ViewController.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var headerView: UIView!
    var logoImageView: UIImageView!
    var logoLabel: UILabel!
    var taglineLable: UILabel!
    var signInButton: UIButton!
    
    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    var signInLabel = UILabel()
    var loadingView: UIView = UIView()
    
    var googleOauthSignInButton: GIDSignInButton!
    
    let blue = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().clientID = "677384728906-rbj660t12ucu51eot9tv7556f2sioamp.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
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
        taglineLable.text = "An easier way to check in."
        taglineLable.textColor = UIColor(red: 252/255, green: 252/255, blue: 254/255, alpha: 1)
        taglineLable.font = UIFont.systemFont(ofSize: 15)
        
        view.addSubview(headerView)
        headerView.addSubview(logoImageView)
        headerView.addSubview(logoLabel)
        headerView.addSubview(taglineLable)
        
        googleOauthSignInButton = GIDSignInButton()
        googleOauthSignInButton.translatesAutoresizingMaskIntoConstraints = false
        googleOauthSignInButton.layer.cornerRadius = 5
        view.addSubview(googleOauthSignInButton)
        
//        signInButton = UIButton()
//        signInButton.translatesAutoresizingMaskIntoConstraints = false
//        signInButton.setTitle("Sign In with Google", for: .normal)
//        signInButton.layer.cornerRadius = 5
//        signInButton.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 254/255, alpha: 1)
//        signInButton.setTitleColor(blue, for: .normal)
//        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        
//        view.addSubview(signInButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            headerView.widthAnchor.constraint(equalToConstant: 5*width/8)
            ])
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
            logoImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor)
            ])

        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 5),
            logoLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 30)
            ])

        NSLayoutConstraint.activate([
            taglineLable.centerXAnchor.constraint(equalTo: logoLabel.centerXAnchor),
            taglineLable.bottomAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 15)
            ])
        
        NSLayoutConstraint.activate([
            googleOauthSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleOauthSignInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            googleOauthSignInButton.widthAnchor.constraint(equalToConstant: 300)
            ])
        
//        NSLayoutConstraint.activate([
//            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
//            signInButton.widthAnchor.constraint(equalToConstant: 300)
//            ])
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: self.width, height: self.height)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
            self.loadingView.alpha = 0.75
            
            self.spinner = UIActivityIndicatorView(style: .whiteLarge)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
            
            self.signInLabel.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 40.0)
            self.signInLabel.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2 + 40)
            self.signInLabel.textAlignment = .center
            self.signInLabel.text = "Signing In"
            self.signInLabel.textColor = .white
            self.signInLabel.font = UIFont.systemFont(ofSize: 14)
            
            self.loadingView.addSubview(self.spinner)
            self.loadingView.addSubview(self.signInLabel)
            self.view.addSubview(self.loadingView)
            self.spinner.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.loadingView.removeFromSuperview()
        }
    }
    
    @objc func signIn() {
        let eventsTabBarViewController = EventsTabBarViewController()
        hideActivityIndicator()
        navigationController?.pushViewController(eventsTabBarViewController, animated: true)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        showActivityIndicator()
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            /*
             Perform any operations on signed in user here.
             let userId = user.userID                  // For client-side use only!
             let idToken = user.authentication.idToken // Safe to send to the server
             let fullName = user.profile.name
             let givenName = user.profile.givenName
             let familyName = user.profile.familyName
             let email = user.profile.email
             print("Successful sign in! \n userId: \(userId), idToken: \(idToken), fullName: \(fullName), givenName: \(givenName), familyName: \(familyName), email: \(email)")
             */
            
            let deadlineTime = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                self.signIn()
//                let postsNavigationViewController = PostsNavigationViewController()
//                postsNavigationViewController.user = User(user_id: 1, photo_id: 1)
//                self.hideActivityIndicator()
//                self.navigationController?.pushViewController(postsNavigationViewController, animated: true)
            }
            
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }

}


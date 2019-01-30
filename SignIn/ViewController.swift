//
//  ViewController.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate, UITextFieldDelegate, UINavigationControllerDelegate{
    
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
    
    var signInView: UIView!
    
    var emailTextField: UITextField!
    var emailLabel: UILabel!
    
    var passwordTextField: UITextField!
    var passwordLabel: UILabel!
    
    var googleOauthSignInButton: GIDSignInButton!
    var signUpButton: UIButton!
    
    let blue = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController.swift opened")
        
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
        logoLabel.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        
        taglineLable = UILabel()
        taglineLable.translatesAutoresizingMaskIntoConstraints = false
        taglineLable.text = "An easier way to check in."
        taglineLable.textColor = UIColor(red: 252/255, green: 252/255, blue: 254/255, alpha: 1)
        taglineLable.font = UIFont.systemFont(ofSize: 18)
        
        view.addSubview(headerView)
        headerView.addSubview(logoImageView)
        headerView.addSubview(logoLabel)
        headerView.addSubview(taglineLable)
        
        signInView = UIView()
        signInView.translatesAutoresizingMaskIntoConstraints = false
        signInView.backgroundColor = .white
        signInView.layer.cornerRadius = 15
        
        googleOauthSignInButton = GIDSignInButton()
        googleOauthSignInButton.translatesAutoresizingMaskIntoConstraints = false
        googleOauthSignInButton.layer.cornerRadius = 5
        signInView.addSubview(googleOauthSignInButton)
        
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        emailTextField.borderStyle = .none
        emailTextField.layer.backgroundColor = UIColor.white.cgColor
        emailTextField.layer.masksToBounds = false
        emailTextField.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1).cgColor
        emailTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        emailTextField.layer.shadowOpacity = 1.0
        emailTextField.layer.shadowRadius = 0.0
        emailTextField.delegate = self
        
        signInView.addSubview(emailLabel)
        signInView.addSubview(emailTextField)
        
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.textColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        passwordTextField.borderStyle = .none
        passwordTextField.layer.backgroundColor = UIColor.white.cgColor
        passwordTextField.layer.masksToBounds = false
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1).cgColor
        passwordTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        passwordTextField.layer.shadowOpacity = 1.0
        passwordTextField.layer.shadowRadius = 0.0
        passwordTextField.delegate = self
        
        signInView.addSubview(passwordLabel)
        signInView.addSubview(passwordTextField)
        
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Log In", for: .normal)
        signInButton.layer.cornerRadius = 5
        signInButton.backgroundColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        
        signInView.addSubview(signInButton)
        view.addSubview(signInView)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Don't have an account? Sign up!", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        setUpConstraints()
        hideKeyboard()
        isLoggedIn()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -175),
            headerView.heightAnchor.constraint(equalToConstant: 100),
            headerView.widthAnchor.constraint(equalToConstant: 5*width/8)
            ])
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
            logoImageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 30)
            ])

        NSLayoutConstraint.activate([
            logoLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            logoLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -30)
            ])

        NSLayoutConstraint.activate([
            taglineLable.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            taglineLable.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            signInView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50),
            signInView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInView.bottomAnchor.constraint(equalTo: googleOauthSignInButton.bottomAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: signInView.topAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 30),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
            signInButton.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -30),
            signInButton.heightAnchor.constraint(equalToConstant: 45)
            ])
        
        NSLayoutConstraint.activate([
            googleOauthSignInButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            googleOauthSignInButton.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            googleOauthSignInButton.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),
            googleOauthSignInButton.heightAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            signUpButton.trailingAnchor.constraint(equalTo: signInView.trailingAnchor),
            signUpButton.topAnchor.constraint(equalTo: signInView.bottomAnchor, constant: 5)
            ])

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
        if let email = emailTextField?.text, let password = passwordTextField?.text {
            self.showActivityIndicator()
            print("signIn")
            NetworkManager.loginUser(email: email, password: password) { registeredUser in
                DispatchQueue.main.async {
                    print(registeredUser.user.email)
                    print(registeredUser.user.first_name)
                    print(registeredUser.user.last_name)
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    UserDefaults.standard.set(registeredUser.user.id, forKey: "currentUserId")
                    UserDefaults.standard.synchronize()
                    let eventsTabBarViewController = EventsTabBarViewController()
                    eventsTabBarViewController.userInformation = registeredUser.user
                    self.hideActivityIndicator()
                    self.navigationController?.pushViewController(eventsTabBarViewController, animated: true)
                }
            }
        }
    }
    
    func isLoggedIn() {
        if (UserDefaults.standard.bool(forKey: "isLoggedIn")) {
            presentApp()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    @objc func signUp() {
        let signUpViewController = SignUpViewController()
        navigationController?.present(signUpViewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        showActivityIndicator()
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            let deadlineTime = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                let eventsTabBarViewController = EventsTabBarViewController()
                self.hideActivityIndicator()
                self.navigationController?.pushViewController(eventsTabBarViewController, animated: true)
            }
        }
    }
    
    func presentApp() {
        let eventsTabBarViewController = EventsTabBarViewController()
        self.hideActivityIndicator()
        self.navigationController?.pushViewController(eventsTabBarViewController, animated: false)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}


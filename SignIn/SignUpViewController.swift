//
//  SignInViewController.swift
//  SignIn
//
//  Created by Lucy Xu on 1/27/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var signInView: UIView!
    
    var firstNameLabel: UILabel!
    var firstNameTextField: UITextField!
    var lastNameLabel: UILabel!
    var lastNameTextField: UITextField!
    var emailTextField: UITextField!
    var emailLabel: UILabel!
    var passwordTextField: UITextField!
    var passwordLabel: UILabel!
    var confirmPasswordTextField: UITextField!
    var confirmPasswordLabel: UILabel!
    
    var signInButton: UIButton!
    var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        
        signInView = UIView()
        signInView.translatesAutoresizingMaskIntoConstraints = false
        signInView.backgroundColor = .white
        signInView.layer.cornerRadius = 15
        
        firstNameLabel = UILabel()
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.textColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
        firstNameLabel.text = "First Name"
        firstNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        firstNameTextField = UITextField()
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextField.textColor = .black
        firstNameTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        firstNameTextField.borderStyle = .none
        firstNameTextField.layer.backgroundColor = UIColor.white.cgColor
        firstNameTextField.layer.masksToBounds = false
        firstNameTextField.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1).cgColor
        firstNameTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        firstNameTextField.layer.shadowOpacity = 1.0
        firstNameTextField.layer.shadowRadius = 0.0
        firstNameTextField.delegate = self
        
        signInView.addSubview(firstNameLabel)
        signInView.addSubview(firstNameTextField)
        
        lastNameLabel = UILabel()
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.textColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
        lastNameLabel.text = "Last Name"
        lastNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        lastNameTextField = UITextField()
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.textColor = .black
        lastNameTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        lastNameTextField.borderStyle = .none
        lastNameTextField.layer.backgroundColor = UIColor.white.cgColor
        lastNameTextField.layer.masksToBounds = false
        lastNameTextField.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1).cgColor
        lastNameTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        lastNameTextField.layer.shadowOpacity = 1.0
        lastNameTextField.layer.shadowRadius = 0.0
        lastNameTextField.delegate = self
        
        signInView.addSubview(lastNameLabel)
        signInView.addSubview(lastNameTextField)
        
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
        
        confirmPasswordLabel = UILabel()
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordLabel.textColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
        confirmPasswordLabel.text = "Confirm Password"
        confirmPasswordLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        confirmPasswordTextField = UITextField()
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.textColor = .black
        confirmPasswordTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        confirmPasswordTextField.borderStyle = .none
        confirmPasswordTextField.layer.backgroundColor = UIColor.white.cgColor
        confirmPasswordTextField.layer.masksToBounds = false
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1).cgColor
        confirmPasswordTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        confirmPasswordTextField.layer.shadowOpacity = 1.0
        confirmPasswordTextField.layer.shadowRadius = 0.0
        confirmPasswordTextField.delegate = self
        
        signInView.addSubview(confirmPasswordLabel)
        signInView.addSubview(confirmPasswordTextField)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1).cgColor
        signUpButton.layer.borderWidth = 3
        signUpButton.backgroundColor = .white
        signUpButton.setTitleColor(UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1), for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        
        signInView.addSubview(signUpButton)
        
        view.addSubview(signInView)
        
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Already have an account? Sign in!", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        view.addSubview(signInButton)
        
        setUpConstraints()
        hideKeyboard()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            signInView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInView.topAnchor.constraint(equalTo: firstNameLabel.topAnchor, constant: -50),
            signInView.bottomAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 50),
            ])
        
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: signInView.topAnchor, constant: 50),
            firstNameLabel.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 30),
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 10),
            firstNameTextField.leadingAnchor.constraint(equalTo: firstNameLabel.leadingAnchor),
            firstNameTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -30),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 15),
            lastNameLabel.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 30),
            lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 10),
            lastNameTextField.leadingAnchor.constraint(equalTo: lastNameLabel.leadingAnchor),
            lastNameTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -30),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 15),
            emailLabel.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 30),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordLabel.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 30),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 30),
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 10),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: confirmPasswordLabel.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -30),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 35),
            signUpButton.leadingAnchor.constraint(equalTo: signInView.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: signInView.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 45)
            ])
        
        NSLayoutConstraint.activate([
            signInButton.trailingAnchor.constraint(equalTo: signInView.trailingAnchor),
            signInButton.topAnchor.constraint(equalTo: signInView.bottomAnchor, constant: 5)
            ])
        
    }
    
    @objc func signIn() {
        self.dismiss(animated: true, completion: nil)
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
    
    @objc func signUp() {
        if let email = emailTextField?.text, let password = passwordTextField?.text,
            let confirmPassword = confirmPasswordTextField?.text, let firstName = firstNameTextField?.text,
            let lastName = lastNameTextField?.text {
            if (password == confirmPassword) {
                print("email is \(email)")
                print("password is \(password) \(confirmPassword)")
                print("name is \(firstName) \(lastName)")
                NetworkManager.registerUser(email: email, password: password, first_name: firstName, last_name: lastName) { registeredUser in
                    DispatchQueue.main.async {
                        print("registered")
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.dismiss
    }
    */

}

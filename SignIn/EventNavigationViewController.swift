//
//  EventNavigationViewController.swift
//  SignIn
//
//  Created by Lucy Xu on 1/24/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit
import LocalAuthentication

class EventNavigationViewController: UIViewController {
    
    var eventOverlayImageView: UIImageView!
    var cornellImageView: UIImageView!
    var eventLayerView: UIView!
    var event: Event!
    var eventClubLabel: UILabel!
    var eventTitleLabel: UILabel!
    var signInEventButton: UIButton!
    var signInStatusImageView: UIImageView!
    var locationImageView: UIImageView!
    var eventLocationLabel: UILabel!
    var descriptionImageView: UIImageView!
    var descriptionLabel: UILabel!

    lazy var signInPopUpUIView: SignInPopUpUIView = {
        let view = SignInPopUpUIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.delegate = self
        return view
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = event.club
        
        let backImage = UIImage(named: "back-arrow")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        cornellImageView = UIImageView()
        cornellImageView.translatesAutoresizingMaskIntoConstraints = false
        cornellImageView.image = UIImage(named: "cornell")
        cornellImageView.contentMode = .scaleAspectFill
        cornellImageView.clipsToBounds = true
        
        eventOverlayImageView = UIImageView()
        eventOverlayImageView.translatesAutoresizingMaskIntoConstraints = false
        eventOverlayImageView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        
        eventLayerView = UIView()
        eventLayerView.translatesAutoresizingMaskIntoConstraints = false
        eventLayerView.backgroundColor = .white
        eventLayerView.layer.cornerRadius = 10
        
        signInStatusImageView = UIImageView()
        signInStatusImageView.translatesAutoresizingMaskIntoConstraints = false
        signInStatusImageView.backgroundColor = UIColor(red: 255/255, green: 99/255, blue: 71/255, alpha: 1)
        signInStatusImageView.layer.cornerRadius = 5
        
        eventClubLabel = UILabel()
        eventClubLabel.translatesAutoresizingMaskIntoConstraints = false
        eventClubLabel.text = event.club
        eventClubLabel.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        eventClubLabel.lineBreakMode = .byWordWrapping
        eventClubLabel.numberOfLines = 0
        
        eventTitleLabel = UILabel()
        eventTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        eventTitleLabel.text = event.event
        eventTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        eventTitleLabel.lineBreakMode = .byWordWrapping
        eventTitleLabel.numberOfLines = 0
        
        signInEventButton = UIButton()
        signInEventButton.translatesAutoresizingMaskIntoConstraints = false
        signInEventButton.setTitle("Confirm Sign In", for: .normal)
        signInEventButton.setTitleColor(UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1), for: .normal)
        signInEventButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        signInEventButton.layer.cornerRadius = 25
        signInEventButton.layer.shadowColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1).cgColor
        signInEventButton.layer.shadowOpacity = 0.6;
        signInEventButton.layer.shadowRadius = 20;
        signInEventButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        signInEventButton.addTarget(self, action: #selector(authenticateEventSignIn), for: .touchUpInside)
        
        eventLocationLabel = UILabel()
        eventLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        eventLocationLabel.text = event.location
        eventLocationLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        locationImageView = UIImageView()
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        locationImageView.image = UIImage(named: "location")
        
        descriptionImageView = UIImageView()
        descriptionImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionImageView.image = UIImage(named: "description")
        
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = event.description
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        
        eventLayerView.addSubview(eventClubLabel)
        eventLayerView.addSubview(eventTitleLabel)
        eventLayerView.addSubview(signInEventButton)
        eventLayerView.addSubview(signInStatusImageView)
        eventLayerView.addSubview(eventLocationLabel)
        eventLayerView.addSubview(descriptionLabel)
        eventLayerView.addSubview(locationImageView)
        eventLayerView.addSubview(descriptionImageView)
        
        view.addSubview(cornellImageView)
        view.addSubview(eventOverlayImageView)
        view.addSubview(eventLayerView)
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        visualEffectView.alpha = 0
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            cornellImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cornellImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cornellImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cornellImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            cornellImageView.heightAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            eventOverlayImageView.topAnchor.constraint(equalTo: cornellImageView.topAnchor),
            eventOverlayImageView.leadingAnchor.constraint(equalTo: cornellImageView.leadingAnchor),
            eventOverlayImageView.trailingAnchor.constraint(equalTo: cornellImageView.trailingAnchor),
            eventOverlayImageView.widthAnchor.constraint(equalTo: cornellImageView.widthAnchor),
            eventOverlayImageView.heightAnchor.constraint(equalTo: cornellImageView.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            eventLayerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            eventLayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventLayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eventLayerView.topAnchor.constraint(equalTo: cornellImageView.bottomAnchor, constant: -30),
            ])
        
        NSLayoutConstraint.activate([
            signInStatusImageView.topAnchor.constraint(equalTo: eventLayerView.topAnchor, constant: 30),
            signInStatusImageView.leadingAnchor.constraint(equalTo: eventLayerView.leadingAnchor, constant: 30),
            signInStatusImageView.heightAnchor.constraint(equalToConstant: 15),
            signInStatusImageView.widthAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            eventClubLabel.centerYAnchor.constraint(equalTo: signInStatusImageView.centerYAnchor),
            eventClubLabel.leadingAnchor.constraint(equalTo: signInStatusImageView.trailingAnchor, constant: 20),
            eventClubLabel.trailingAnchor.constraint(equalTo: eventLayerView.trailingAnchor, constant: -30),
            eventTitleLabel.topAnchor.constraint(equalTo: eventClubLabel.bottomAnchor, constant: 5),
            eventTitleLabel.leadingAnchor.constraint(equalTo: eventClubLabel.leadingAnchor),
            eventTitleLabel.trailingAnchor.constraint(equalTo: eventClubLabel.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            locationImageView.centerYAnchor.constraint(equalTo: eventLocationLabel.centerYAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: signInStatusImageView.leadingAnchor),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            eventLocationLabel.topAnchor.constraint(equalTo: eventTitleLabel.bottomAnchor, constant: 25),
            eventLocationLabel.leadingAnchor.constraint(equalTo: eventClubLabel.leadingAnchor),
            eventLocationLabel.trailingAnchor.constraint(equalTo: eventClubLabel.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            descriptionImageView.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor),
            descriptionImageView.leadingAnchor.constraint(equalTo: signInStatusImageView.leadingAnchor),
            descriptionImageView.heightAnchor.constraint(equalToConstant: 20),
            descriptionImageView.widthAnchor.constraint(equalToConstant: 20),
            descriptionLabel.topAnchor.constraint(equalTo: eventLocationLabel.bottomAnchor, constant: 25),
            descriptionLabel.leadingAnchor.constraint(equalTo: eventClubLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: eventClubLabel.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            signInEventButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -75),
            signInEventButton.leadingAnchor.constraint(equalTo: eventLayerView.leadingAnchor, constant: 75),
            signInEventButton.trailingAnchor.constraint(equalTo: eventLayerView.trailingAnchor, constant: -75),
            signInEventButton.heightAnchor.constraint(equalToConstant: 40)
            ])

    }
    
    func setUpPopUpConstraints() {
        NSLayoutConstraint.activate([
            signInPopUpUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInPopUpUIView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInPopUpUIView.heightAnchor.constraint(equalToConstant: 300),
            signInPopUpUIView.widthAnchor.constraint(equalToConstant: 300)
            ])
        
        signInPopUpUIView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        signInPopUpUIView.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 1
            self.signInPopUpUIView.alpha = 1
            self.signInPopUpUIView.transform = CGAffineTransform.identity
            })
    }
    
    @objc func authenticateEventSignIn() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Event Verification for Sign In"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        print("success")
                        self.view.addSubview(self.signInPopUpUIView)
                        self.setUpPopUpConstraints()
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "Try again!", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EventNavigationViewController: PopUpDelegate {
    func handleDismissal() {
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 0
            self.signInPopUpUIView.alpha = 0
            self.signInPopUpUIView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.signInPopUpUIView.removeFromSuperview()
        }
    }
}

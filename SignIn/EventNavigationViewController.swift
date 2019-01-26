//
//  EventNavigationViewController.swift
//  SignIn
//
//  Created by Lucy Xu on 1/24/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit

class EventNavigationViewController: UIViewController {
    
    var eventOverlayImageView: UIImageView!
    var cornellImageView: UIImageView!
    var eventLayerView: UIView!
    var event: Event!
    var eventClubLabel: UILabel!
    var eventTitleLabel: UILabel!
    var signInEventButton: UIButton!
    var signInStatusImageView: UIImageView!
    var eventLocationLabel: UILabel!


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
        
        eventTitleLabel = UILabel()
        eventTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        eventTitleLabel.text = event.event
        eventTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
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
        signInEventButton.addTarget(self, action: #selector(signInEvent), for: .touchUpInside)
        
        eventLocationLabel = UILabel()
        eventLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        eventLocationLabel.text = "\(event.building), \(event.room)"
        eventLocationLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        eventLayerView.addSubview(eventClubLabel)
        eventLayerView.addSubview(eventTitleLabel)
        eventLayerView.addSubview(signInEventButton)
        eventLayerView.addSubview(signInStatusImageView)
        eventLayerView.addSubview(eventLocationLabel)
        
        view.addSubview(cornellImageView)
        view.addSubview(eventOverlayImageView)
        view.addSubview(eventLayerView)
        
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
            eventLocationLabel.topAnchor.constraint(equalTo: eventTitleLabel.bottomAnchor, constant: 25),
            eventLocationLabel.leadingAnchor.constraint(equalTo: eventClubLabel.leadingAnchor),
            eventLocationLabel.trailingAnchor.constraint(equalTo: eventClubLabel.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            signInEventButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -75),
            signInEventButton.leadingAnchor.constraint(equalTo: eventLayerView.leadingAnchor, constant: 75),
            signInEventButton.trailingAnchor.constraint(equalTo: eventLayerView.trailingAnchor, constant: -75),
            signInEventButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    @objc func signInEvent() {
        print("sign in!")
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

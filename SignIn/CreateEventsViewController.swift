//
//  CreateEventsViewController.swift
//  SignIn
//
//  Created by Lucy Xu on 1/23/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit

class CreateEventsViewController: UIViewController {
    
    var dismissButton: UIButton!
    var createEventLabel: UILabel!
    var organizationLabel: UILabel!
    var organizationTextField: UITextField!
    var eventNameLabel: UILabel!
    var eventNameTextField: UITextField!
    var buildingLabel: UILabel!
    var buildingTextField: UITextField!
    var roomLabel: UILabel!
    var roomTextField: UITextField!
    var createEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        dismissButton = UIButton()
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setImage(UIImage(named: "dismiss"), for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissCreateView), for: .touchUpInside)
        
        createEventLabel = UILabel()
        createEventLabel.translatesAutoresizingMaskIntoConstraints = false
        createEventLabel.textColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        createEventLabel.text = "Create Event"
        createEventLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        organizationLabel = UILabel()
        organizationLabel.translatesAutoresizingMaskIntoConstraints = false
        organizationLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        organizationLabel.text = "Organization"
        organizationLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        organizationTextField = UITextField()
        organizationTextField.translatesAutoresizingMaskIntoConstraints = false
        organizationTextField.textColor = .black
        organizationTextField.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        organizationTextField.borderStyle = .none
        organizationTextField.layer.backgroundColor = UIColor.white.cgColor
        organizationTextField.layer.masksToBounds = false
        organizationTextField.layer.shadowColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        organizationTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        organizationTextField.layer.shadowOpacity = 1.0
        organizationTextField.layer.shadowRadius = 0.0
        
        eventNameLabel = UILabel()
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        eventNameLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        eventNameLabel.text = "Event Name"
        eventNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        eventNameTextField = UITextField()
        eventNameTextField.translatesAutoresizingMaskIntoConstraints = false
        eventNameTextField.textColor = .black
        eventNameTextField.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        eventNameTextField.borderStyle = .none
        eventNameTextField.layer.backgroundColor = UIColor.white.cgColor
        eventNameTextField.layer.masksToBounds = false
        eventNameTextField.layer.shadowColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        eventNameTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        eventNameTextField.layer.shadowOpacity = 1.0
        eventNameTextField.layer.shadowRadius = 0.0
        
        buildingLabel = UILabel()
        buildingLabel.translatesAutoresizingMaskIntoConstraints = false
        buildingLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        buildingLabel.text = "Building"
        buildingLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        buildingTextField = UITextField()
        buildingTextField.translatesAutoresizingMaskIntoConstraints = false
        buildingTextField.textColor = .black
        buildingTextField.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        buildingTextField.borderStyle = .none
        buildingTextField.layer.backgroundColor = UIColor.white.cgColor
        buildingTextField.layer.masksToBounds = false
        buildingTextField.layer.shadowColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        buildingTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        buildingTextField.layer.shadowOpacity = 1.0
        buildingTextField.layer.shadowRadius = 0.0
        
        roomLabel = UILabel()
        roomLabel.translatesAutoresizingMaskIntoConstraints = false
        roomLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        roomLabel.text = "Room"
        roomLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        roomTextField = UITextField()
        roomTextField.translatesAutoresizingMaskIntoConstraints = false
        roomTextField.textColor = .black
        roomTextField.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        roomTextField.borderStyle = .none
        roomTextField.layer.backgroundColor = UIColor.white.cgColor
        roomTextField.layer.masksToBounds = false
        roomTextField.layer.shadowColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        roomTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        roomTextField.layer.shadowOpacity = 1.0
        roomTextField.layer.shadowRadius = 0.0
        
        createEventButton = UIButton()
        createEventButton.translatesAutoresizingMaskIntoConstraints = false
        createEventButton.setTitle("Submit", for: .normal)
        createEventButton.setTitleColor(UIColor(red: 228/255, green: 183/255, blue: 90/255, alpha: 1), for: .normal)
        createEventButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        createEventButton.layer.cornerRadius = 25
        createEventButton.backgroundColor = UIColor(red: 254/255, green: 231/255, blue: 171/255, alpha: 1)
        createEventButton.addTarget(self, action: #selector(dismissCreateView), for: .touchUpInside)
        
        view.addSubview(dismissButton)
        view.addSubview(createEventLabel)
        view.addSubview(organizationLabel)
        view.addSubview(organizationTextField)
        view.addSubview(eventNameLabel)
        view.addSubview(eventNameTextField)
        view.addSubview(buildingLabel)
        view.addSubview(buildingTextField)
        view.addSubview(roomLabel)
        view.addSubview(roomTextField)
        view.addSubview(createEventButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            dismissButton.widthAnchor.constraint(equalToConstant: 18),
            dismissButton.heightAnchor.constraint(equalToConstant: 18),
            createEventLabel.topAnchor.constraint(equalTo: dismissButton.topAnchor),
            createEventLabel.leadingAnchor.constraint(equalTo: dismissButton.trailingAnchor, constant: 25)
            ])
        
        NSLayoutConstraint.activate([
            organizationLabel.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 40),
            organizationLabel.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            organizationTextField.topAnchor.constraint(equalTo: organizationLabel.bottomAnchor, constant: 15),
            organizationTextField.leadingAnchor.constraint(equalTo: organizationLabel.leadingAnchor),
            organizationTextField.heightAnchor.constraint(equalToConstant: 15),
            organizationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
            ])
        
        NSLayoutConstraint.activate([
            eventNameLabel.topAnchor.constraint(equalTo: organizationTextField.bottomAnchor, constant: 25),
            eventNameLabel.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            eventNameTextField.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 15),
            eventNameTextField.leadingAnchor.constraint(equalTo: eventNameLabel.leadingAnchor),
            eventNameTextField.trailingAnchor.constraint(equalTo: organizationTextField.trailingAnchor),
            eventNameTextField.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            buildingLabel.topAnchor.constraint(equalTo: eventNameTextField.bottomAnchor, constant: 25),
            buildingLabel.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            buildingTextField.topAnchor.constraint(equalTo: buildingLabel.bottomAnchor, constant: 15),
            buildingTextField.leadingAnchor.constraint(equalTo: buildingLabel.leadingAnchor),
            buildingTextField.trailingAnchor.constraint(equalTo: organizationTextField.trailingAnchor),
            buildingTextField.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            roomLabel.topAnchor.constraint(equalTo: buildingTextField.bottomAnchor, constant: 25),
            roomLabel.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            roomTextField.topAnchor.constraint(equalTo: roomLabel.bottomAnchor, constant: 15),
            roomTextField.leadingAnchor.constraint(equalTo: roomLabel.leadingAnchor),
            roomTextField.trailingAnchor.constraint(equalTo: organizationTextField.trailingAnchor),
            roomTextField.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            createEventButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -75),
            createEventButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            createEventButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            createEventButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    @objc func dismissCreateView() {
        self.dismiss(animated: true, completion: nil)
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

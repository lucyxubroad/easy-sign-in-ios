//
//  CreateEventsViewController.swift
//  SignIn
//
//  Created by Lucy Xu on 1/23/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit

class CreateEventsViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var dismissButton: UIButton!
    var createEventLabel: UILabel!
    var organizationLabel: UILabel!
    var organizationTextField: UITextField!
    var eventNameLabel: UILabel!
    var eventNameTextField: UITextField!
    var locationLabel: UILabel!
    var locationTextField: UITextField!
    var roomLabel: UILabel!
    var descriptionTextField: UITextField!
    var createEventButton: UIButton!
    var eventImageView: UIImageView!
    var eventTintedImageView: UIImageView!
    var eventImagePickerButton: UIButton!
    var eventImagePickerController: UIImagePickerController!
    var eventImageName = "fogg-1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        dismissButton = UIButton()
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setImage(UIImage(named: "dismiss"), for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissCreateView), for: .touchUpInside)
        
        createEventLabel = UILabel()
        createEventLabel.translatesAutoresizingMaskIntoConstraints = false
        createEventLabel.textColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        createEventLabel.text = "Create Event"
        createEventLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        eventImageView = UIImageView()
        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        eventImageView.layer.cornerRadius = 20
        eventImageView.image = UIImage(named: "fogg-1")
        eventImageView.contentMode = .scaleAspectFill
        eventImageView.clipsToBounds = true
        
        eventTintedImageView = UIImageView()
        eventTintedImageView.translatesAutoresizingMaskIntoConstraints = false
        eventTintedImageView.layer.cornerRadius = 20
        eventTintedImageView.backgroundColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 0.2)
        
        eventImagePickerButton = UIButton()
        eventImagePickerButton.translatesAutoresizingMaskIntoConstraints = false
        eventImagePickerButton.setTitle("Select banner", for: .normal)
        eventImagePickerButton.setTitleColor(UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1), for: .normal)
        eventImagePickerButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        eventImagePickerButton.addTarget(self, action: #selector(openBannerGallery), for: .touchUpInside)
        
        eventImagePickerController = UIImagePickerController()
        
        organizationLabel = UILabel()
        organizationLabel.translatesAutoresizingMaskIntoConstraints = false
        organizationLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        organizationLabel.text = "Organization"
        organizationLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        organizationTextField = UITextField()
        organizationTextField.translatesAutoresizingMaskIntoConstraints = false
        organizationTextField.textColor = .black
        organizationTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        organizationTextField.borderStyle = .none
        organizationTextField.layer.backgroundColor = UIColor.white.cgColor
        organizationTextField.layer.masksToBounds = false
        organizationTextField.layer.shadowColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        organizationTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        organizationTextField.layer.shadowOpacity = 1.0
        organizationTextField.layer.shadowRadius = 0.0
        organizationTextField.delegate = self
        
        eventNameLabel = UILabel()
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        eventNameLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        eventNameLabel.text = "Event Name"
        eventNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        eventNameTextField = UITextField()
        eventNameTextField.translatesAutoresizingMaskIntoConstraints = false
        eventNameTextField.textColor = .black
        eventNameTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        eventNameTextField.borderStyle = .none
        eventNameTextField.layer.backgroundColor = UIColor.white.cgColor
        eventNameTextField.layer.masksToBounds = false
        eventNameTextField.layer.shadowColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        eventNameTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        eventNameTextField.layer.shadowOpacity = 1.0
        eventNameTextField.layer.shadowRadius = 0.0
        eventNameTextField.delegate = self
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        locationLabel.text = "Location"
        locationLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        locationTextField = UITextField()
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.textColor = .black
        locationTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        locationTextField.borderStyle = .none
        locationTextField.layer.backgroundColor = UIColor.white.cgColor
        locationTextField.layer.masksToBounds = false
        locationTextField.layer.shadowColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        locationTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        locationTextField.layer.shadowOpacity = 1.0
        locationTextField.layer.shadowRadius = 0.0
        locationTextField.delegate = self
        
        roomLabel = UILabel()
        roomLabel.translatesAutoresizingMaskIntoConstraints = false
        roomLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        roomLabel.text = "Description"
        roomLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        descriptionTextField = UITextField()
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.textColor = .black
        descriptionTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        descriptionTextField.borderStyle = .none
        descriptionTextField.layer.backgroundColor = UIColor.white.cgColor
        descriptionTextField.layer.masksToBounds = false
        descriptionTextField.layer.shadowColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        descriptionTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        descriptionTextField.layer.shadowOpacity = 1.0
        descriptionTextField.layer.shadowRadius = 0.0
        descriptionTextField.delegate = self
        
        createEventButton = UIButton()
        createEventButton.translatesAutoresizingMaskIntoConstraints = false
        createEventButton.setTitle("Submit", for: .normal)
        createEventButton.setTitleColor(UIColor(red: 228/255, green: 183/255, blue: 90/255, alpha: 1), for: .normal)
        createEventButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        createEventButton.layer.cornerRadius = 25
        createEventButton.backgroundColor = UIColor(red: 254/255, green: 231/255, blue: 171/255, alpha: 1)
        createEventButton.addTarget(self, action: #selector(createEvent), for: .touchUpInside)
        
        view.addSubview(dismissButton)
        view.addSubview(createEventLabel)
        view.addSubview(organizationLabel)
        view.addSubview(organizationTextField)
        view.addSubview(eventNameLabel)
        view.addSubview(eventNameTextField)
        view.addSubview(locationLabel)
        view.addSubview(locationTextField)
        view.addSubview(roomLabel)
        view.addSubview(descriptionTextField)
        view.addSubview(createEventButton)
        view.addSubview(eventImageView)
        view.addSubview(eventTintedImageView)
        view.addSubview(eventImagePickerButton)
        
        setUpConstraints()
        hideKeyboard()
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            dismissButton.widthAnchor.constraint(equalToConstant: 18),
            dismissButton.heightAnchor.constraint(equalToConstant: 18),
            createEventLabel.topAnchor.constraint(equalTo: dismissButton.topAnchor),
            createEventLabel.leadingAnchor.constraint(equalTo: dismissButton.trailingAnchor, constant: 25)
            ])
        
        NSLayoutConstraint.activate([
            eventImageView.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 30),
            eventImageView.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            eventImageView.heightAnchor.constraint(equalToConstant: 80),
            eventImageView.widthAnchor.constraint(equalToConstant: 190),
            eventTintedImageView.topAnchor.constraint(equalTo: eventImageView.topAnchor),
            eventTintedImageView.bottomAnchor.constraint(equalTo: eventImageView.bottomAnchor),
            eventTintedImageView.leadingAnchor.constraint(equalTo: eventImageView.leadingAnchor),
            eventTintedImageView.trailingAnchor.constraint(equalTo: eventImageView.trailingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            eventImagePickerButton.centerYAnchor.constraint(equalTo: eventImageView.centerYAnchor),
            eventImagePickerButton.leadingAnchor.constraint(equalTo: eventImageView.trailingAnchor, constant: 10),
            eventImagePickerButton.trailingAnchor.constraint(equalTo: organizationTextField.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            organizationLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 20),
            organizationLabel.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            organizationTextField.topAnchor.constraint(equalTo: organizationLabel.bottomAnchor, constant: 10),
            organizationTextField.leadingAnchor.constraint(equalTo: organizationLabel.leadingAnchor),
            organizationTextField.heightAnchor.constraint(equalToConstant: 15),
            organizationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
            ])
        
        NSLayoutConstraint.activate([
            eventNameLabel.topAnchor.constraint(equalTo: organizationTextField.bottomAnchor, constant: 20),
            eventNameLabel.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            eventNameTextField.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 10),
            eventNameTextField.leadingAnchor.constraint(equalTo: eventNameLabel.leadingAnchor),
            eventNameTextField.trailingAnchor.constraint(equalTo: organizationTextField.trailingAnchor),
            eventNameTextField.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: eventNameTextField.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            locationTextField.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            locationTextField.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            locationTextField.trailingAnchor.constraint(equalTo: organizationTextField.trailingAnchor),
            locationTextField.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            roomLabel.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 20),
            roomLabel.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            descriptionTextField.topAnchor.constraint(equalTo: roomLabel.bottomAnchor, constant: 10),
            descriptionTextField.leadingAnchor.constraint(equalTo: roomLabel.leadingAnchor),
            descriptionTextField.trailingAnchor.constraint(equalTo: organizationTextField.trailingAnchor),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 15)
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
    
    @objc func createEvent() {
        if let event = eventNameTextField.text, let club = organizationTextField.text, let location = locationTextField.text, let description = descriptionTextField.text {
            NetworkManager.createEvent(event: event, club: club, location: location, description: description, event_creator: UserDefaults.standard.integer(forKey: "currentUserId"), photo: eventImageName) { newEvent in
                DispatchQueue.main.async {
                    print(newEvent)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
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
    
    @objc func openImageGallery() {
        eventImagePickerController.delegate = self
        eventImagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(eventImagePickerController, animated: true, completion: nil)
    }
    
    @objc func openBannerGallery() {
        let bannerSelectViewController = BannerSelectViewController()
        bannerSelectViewController.delegate = self
        self.present(bannerSelectViewController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        eventImageView.image = image
        dismiss(animated: true, completion: nil)
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

extension CreateEventsViewController: BannerSelectionDelegate {
    func selectBanner(image: String) {
        eventImageView.image = UIImage(named: image)
        eventImageName = image
    }
}

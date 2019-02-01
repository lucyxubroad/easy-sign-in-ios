//
//  FavoritesViewController.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import UIKit

class MyEventsViewController: UIViewController {

    var eventsTableView: UITableView!
    let eventsReuseIdentifier = "EventsReuseIdentifier"
    var createEventButton: UIButton!
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "My Events"
        
        let signOutButtonItem = UIBarButtonItem.init(image: UIImage(named: "logout"), style: .done, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem = signOutButtonItem
        
        eventsTableView = UITableView()
        eventsTableView.translatesAutoresizingMaskIntoConstraints = false
        eventsTableView.allowsSelection = true
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        eventsTableView.separatorStyle = .none
        eventsTableView.bounces = false
        eventsTableView.register(EventTableViewCell.self, forCellReuseIdentifier: eventsReuseIdentifier)
        eventsTableView.estimatedRowHeight = 50.0
        eventsTableView.tableFooterView = UIView() // so there's no empty lines at the bottom
        
        createEventButton = UIButton()
        createEventButton.translatesAutoresizingMaskIntoConstraints = false
        createEventButton.setTitle("Create Event", for: .normal)
        createEventButton.setTitleColor(UIColor(red: 228/255, green: 183/255, blue: 90/255, alpha: 1), for: .normal)
        createEventButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium)
        createEventButton.layer.cornerRadius = 25
        createEventButton.backgroundColor = UIColor(red: 254/255, green: 231/255, blue: 171/255, alpha: 1)
        createEventButton.addTarget(self, action: #selector(createEvent), for: .touchUpInside)
        
        view.addSubview(createEventButton)
        view.addSubview(eventsTableView)
        
        setUpConstraints()
        getEvents()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            eventsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            eventsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            eventsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            eventsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
            ])
        
        NSLayoutConstraint.activate([
            createEventButton.topAnchor.constraint(equalTo: eventsTableView.bottomAnchor),
            createEventButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            createEventButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            createEventButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    @objc func createEvent() {
        let createEventsViewController = CreateEventsViewController()
        present(createEventsViewController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.alpha = 1.0
        self.getEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.alpha = 0.0
    }
    
    /// Gets classes from the network by making an API call.
    func getEvents() {
        let userId = UserDefaults.standard.integer(forKey: "currentUserId")
        NetworkManager.getEventsByUserId(userId: userId) { eventsArray in
            self.events = eventsArray
            DispatchQueue.main.async {
                self.eventsTableView.reloadData()
            }
        }
    }
    
    @objc func signOut() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        let signInViewController = ViewController()
        navigationController?.present(signInViewController, animated: false, completion: nil)
    }
}



extension MyEventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: eventsReuseIdentifier, for: indexPath) as! EventTableViewCell
        cell.selectionStyle = .none
        cell.configure(for: events[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        let eventAttendeesViewController = EventAttendeesViewController()
        eventAttendeesViewController.event = event
        navigationController?.pushViewController(eventAttendeesViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath:IndexPath) -> CGFloat
    {
        return 80
    }
    
    //    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    //    {
    //        return 100
    //    }
}

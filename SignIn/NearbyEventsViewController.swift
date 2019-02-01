//
//  VideoViewController.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import UIKit

class NearbyEventsViewController: UIViewController {
    
    var events = [Event]()
    
    var eventsTableView: UITableView!
    let eventsReuseIdentifier = "EventsReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Nearby Events"
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
        
        let signOutButtonItem = UIBarButtonItem.init(image: UIImage(named: "logout"), style: .done, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem = signOutButtonItem
        
        eventsTableView = UITableView()
        eventsTableView.translatesAutoresizingMaskIntoConstraints = false
        eventsTableView.allowsSelection = true
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
        eventsTableView.bounces = false
        eventsTableView.separatorStyle = .none
        eventsTableView.register(EventTableViewCell.self, forCellReuseIdentifier: eventsReuseIdentifier)
        eventsTableView.estimatedRowHeight = 50.0
        eventsTableView.tableFooterView = UIView() // so there's no empty lines at the bottom
        
        view.addSubview(eventsTableView)
        
        setUpConstraints()
        getEvents()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            eventsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            eventsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            eventsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            eventsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    /// Gets classes from the network by making an API call.
    func getEvents() {
        NetworkManager.getEvents { eventsArray in
            self.events = eventsArray
            DispatchQueue.main.async {
                self.eventsTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.alpha = 1.0
        self.getEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.alpha = 0.0
    }
    
    @objc func signOut() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        let signInViewController = ViewController()
        navigationController?.present(signInViewController, animated: false, completion: nil)
    }
    
}

extension NearbyEventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: eventsReuseIdentifier, for: indexPath) as! EventTableViewCell
        cell.selectionStyle = .none
        cell.configure(for: events[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        let eventNavigationViewController = EventNavigationViewController()
        eventNavigationViewController.event = event
        navigationController?.pushViewController(eventNavigationViewController, animated: true)
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

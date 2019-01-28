//
//  VideoViewController.swift
//  SignIn
//
//  Created by Xu, Lucy L. on 12/31/18.
//  Copyright © 2018 Xu, Lucy L. All rights reserved.
//

import UIKit

//let aces = Event(club: "Assorted Aces", event: "Dance Practice", room: "203", building: "Rockefeller Hall")
//let appdev = Event(club: "CUAppDev", event: "Developer Meeting", room: "B04", building: "Upson Hall")
//let aiesec = Event(club: "Cornell AIESEC", event: "General Body Meeting", room: "102", building: "Clarkson Hall")
//
//var events = [aces, appdev, aiesec]

class NearbyEventsViewController: UIViewController {
    
    var events = [Event]()
    
    var eventsTableView: UITableView!
    let eventsReuseIdentifier = "EventsReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
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
        
        eventsTableView = UITableView()
        eventsTableView.translatesAutoresizingMaskIntoConstraints = false
        eventsTableView.allowsSelection = true
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
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
            eventsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
    
    
}

extension NearbyEventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: eventsReuseIdentifier, for: indexPath) as! EventTableViewCell
        print(events[indexPath.row].event)
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
        return 75
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return 100
//    }
}

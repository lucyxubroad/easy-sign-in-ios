//
//  EventAttendeesViewController.swift
//  SignIn
//
//  Created by Lucy Xu on 1/30/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit

class EventAttendeesViewController: UIViewController {
    
    var attendeesTableView: UITableView!
    var attendeesCollectionView: UICollectionView!
    let attendeesReuseIdentifier = "attendeesReuseIdentifier"
    
    var attendees = [User]()
    var event: Event!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = event.club
        
        let backImage = UIImage(named: "back-arrow")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
//        attendeesTableView = UITableView()
//        attendeesTableView.translatesAutoresizingMaskIntoConstraints = false
//        attendeesTableView.allowsSelection = true
//        attendeesTableView.delegate = self
//        attendeesTableView.dataSource = self
////        attendeesTableView.register(AttendeeTableViewCell.self, forCellReuseIdentifier: attendeesReuseIdentifier)
//        attendeesTableView.estimatedRowHeight = 50.0
//        attendeesTableView.tableFooterView = UIView() // so there's no empty lines at the bottom
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        attendeesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        attendeesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        attendeesCollectionView.delegate = self
        attendeesCollectionView.backgroundColor = .white
        attendeesCollectionView.dataSource = self
        attendeesCollectionView.register(AttendeeCollectionViewCell.self, forCellWithReuseIdentifier: attendeesReuseIdentifier)
        
        view.addSubview(attendeesCollectionView)
//        view.addSubview(attendeesTableView)
        
        getAttendees()
        setUpConstraints()
    }

    func getAttendees() {
        NetworkManager.getEventsAttendees(event_id: event.id) { usersArray in
            DispatchQueue.main.async {
                self.attendees = usersArray
                self.attendeesCollectionView.reloadData()
            }
        }
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            attendeesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            attendeesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            attendeesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            attendeesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
            ])
    }

}

extension EventAttendeesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: attendeesReuseIdentifier, for: indexPath) as! AttendeeTableViewCell
        cell.configure(for: attendees[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attendees.count
    }
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath:IndexPath) -> CGFloat
    {
        return 45
    }
}

extension EventAttendeesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attendees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: attendeesReuseIdentifier, for: indexPath) as! AttendeeCollectionViewCell
        print(cell)
        cell.configure(with: attendees[indexPath.row])
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout attendeesCollectionView: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = (collectionView.frame.width - 20) / 3
        return CGSize(width: width, height: width)
    }
}

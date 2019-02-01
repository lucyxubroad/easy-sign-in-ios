//
//  BannerSelectViewController.swift
//  SignIn
//
//  Created by Lucy Xu on 1/30/19.
//  Copyright © 2019 Xu, Lucy L. All rights reserved.
//

import UIKit

protocol BannerSelectionDelegate {
    func selectBanner(image: String)
}

class BannerSelectViewController: UIViewController {
    
    let banners = ["fogg-1", "fogg-2", "fogg-3", "fogg-4", "fogg-5", "fogg-6", "fogg-7", "fogg-8", "fogg-9"]
    var bannerTableView: UITableView!
    let bannerReuseIdentifier = "bannerReuseIdentifier"
    var dismissButton: UIButton!
    var selectBannerLabel: UILabel!
    var delegate: BannerSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        
        dismissButton = UIButton()
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setImage(UIImage(named: "dismiss-white"), for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissSelectBanner), for: .touchUpInside)
        
        selectBannerLabel = UILabel()
        selectBannerLabel.translatesAutoresizingMaskIntoConstraints = false
        selectBannerLabel.textColor = .white
        selectBannerLabel.text = "Select Banner"
        selectBannerLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        bannerTableView = UITableView()
        bannerTableView.translatesAutoresizingMaskIntoConstraints = false
        bannerTableView.allowsSelection = true
        bannerTableView.separatorStyle = .none
        bannerTableView.delegate = self
        bannerTableView.dataSource = self
        bannerTableView.bounces = false
        bannerTableView.register(BannerTableViewCell.self, forCellReuseIdentifier: bannerReuseIdentifier)
        bannerTableView.tableFooterView = UIView() // so there's no empty lines at the bottom
        
        view.addSubview(dismissButton)
        view.addSubview(selectBannerLabel)
        view.addSubview(bannerTableView)
        
        setUpConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            dismissButton.widthAnchor.constraint(equalToConstant: 18),
            dismissButton.heightAnchor.constraint(equalToConstant: 18),
            selectBannerLabel.topAnchor.constraint(equalTo: dismissButton.topAnchor),
            selectBannerLabel.leadingAnchor.constraint(equalTo: dismissButton.trailingAnchor, constant: 25)
            ])
        
        NSLayoutConstraint.activate([
            bannerTableView.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 30),
            bannerTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            bannerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            bannerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
            ])
    }
    
    @objc func dismissSelectBanner() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension BannerSelectViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: bannerReuseIdentifier, for: indexPath) as! BannerTableViewCell
        cell.configure(image: banners[indexPath.row])
        cell.selectionStyle = .none;
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let banner = banners[indexPath.row]
//        let eventNavigationViewController = EventNavigationViewController()
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        eventNavigationViewController.event = event
        delegate?.selectBanner(image: banner)
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banners.count
    }
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath:IndexPath) -> CGFloat
    {
        return 150
    }
    
    //    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    //    {
    //        return 100
    //    }
}


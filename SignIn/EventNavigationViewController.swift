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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let backImage = UIImage(named: "back-arrow")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        eventOverlayImageView = UIImageView()
        eventOverlayImageView.translatesAutoresizingMaskIntoConstraints = false
        eventOverlayImageView.backgroundColor = UIColor(red: 122/255, green: 171/255, blue: 237/255, alpha: 1)
        
        view.addSubview(eventOverlayImageView)
        
        // Do any additional setup after loading the view.
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            eventOverlayImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            eventOverlayImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventOverlayImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eventOverlayImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            eventOverlayImageView.heightAnchor.constraint(equalToConstant: 300)
            ])
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

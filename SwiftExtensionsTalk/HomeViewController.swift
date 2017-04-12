//
//  HomeViewController.swift
//  SwiftExtensionsTalk
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017 Elantrics, Inc. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var showPeopleButton: UIButton! {
        didSet {
            showPeopleButton.setStandard()
        }
    }

    @IBOutlet weak var sampleImageView: UIImageView! {
        didSet {
            sampleImageView.image = UIImage(named: "database")
        }
    }


    @IBAction func onShowPeopleTap(_ sender: Any) {
        let peopleVC = UIStoryboard(appStoryboard: .people).instantiateInitialViewController() as! PeopleViewController

        self.setBackButtonStyle()
        self.navigationController?.pushViewController(peopleVC, animated: true)
    }

    override func viewDidLoad() {
        self.setNavigationTitle("Hello Meetup")
        self.setNavigationTitle(String.AppString.headerHome.rawValue)
        self.setNavigationTitle(String.localized(.headerHome))
    }

}

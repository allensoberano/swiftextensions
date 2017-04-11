//
//  PeopleViewController.swift
//  SwiftExtensionsTalk
//
//  Created by Justin Holman on 4/10/17.
//  Copyright © 2017 Elantrics, Inc. All rights reserved.
//

import Foundation
import UIKit

class PeopleViewController: UIViewController {

    @IBOutlet weak var peopleTableView: UITableView! {
        didSet {
            peopleTableView.setDefaultStyle()

            peopleTableView.dataSource = self
            peopleTableView.delegate = self
        }
    }


    let peoples = ["Justin", "William"]
}

private typealias TableDataSource = PeopleViewController
extension TableDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peoples.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableView.peopleCellIdentifier, for: indexPath)

        let person = peoples[indexPath.row]
        cell.textLabel?.text = person
        return cell
    }
}

private typealias TableDelegate = PeopleViewController
extension TableDelegate: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = peoples[indexPath.row]
        let alertVC = UIAlertController(title: "Message", message: "You selected \(person)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

        alertVC.addAction(okAction)

        self.present(alertVC, animated: true, completion: nil)

    }
}

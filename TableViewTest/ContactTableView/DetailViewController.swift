//
//  DetailViewController.swift
//  ContactTableView
//
//  Created by Rishat on 21.10.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var contactImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        contactImageView.layer.cornerRadius = contactImageView.frame.size.width / 2
    }
    
    func setContact(contact: Contact) {
        contactImageView.image = contact.image
        nameLabel.text = contact.name
        lastNameLabel.text = contact.lastname
        numberLabel.text = contact.number
    }

}

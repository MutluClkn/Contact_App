//
//  ContactsViewController.swift
//  Contact
//
//  Created by Mutlu Çalkan on 13.04.2022.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let contacts = ContactAPI.getContacts()
    
    private let tableView : UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(ContactsTableViewCell.self, forCellReuseIdentifier: ContactsTableViewCell.identifier)
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        navigationBar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func navigationBar(){
        navigationItem.title = "Contacts"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: "#3004AD")
        self.navigationController?.navigationBar.backgroundColor = UIColor(hexString: "#3004AD")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.identifier, for: indexPath) as? ContactsTableViewCell else { return UITableViewCell()}
        if let name = contacts[indexPath.row].name{
            cell.nameLabel.text = name
            cell.contactImage.image = UIImage(named: name)
        }
        if let country = contacts[indexPath.row].country {
            cell.flagImage.image = UIImage(named: country)
        }
        cell.jobTitleLabel.text = contacts[indexPath.row].jobTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

}

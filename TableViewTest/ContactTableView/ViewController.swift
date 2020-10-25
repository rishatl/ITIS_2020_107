//
//  ViewController.swift
//  ContactTableView
//
//  Created by Rishat on 20.10.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
        createContacts()
        loadData()
    }
    
    private enum Section: Int {
        case namesOnA
        case namesOnI
        case namesOnL
        case namesOnS
    }
    
    private struct Cell {
        let contact: Contact
    }
    
    private struct SectionData {
        let cells: [Cell]
    }
    
    private var sectionsData: [SectionData]?
    
    private func loadData() {
        sectionsData = [
            SectionData(cells: [
                .init(contact: contacts[0]),
                .init(contact: contacts[1]),
                .init(contact: contacts[2])
            ]),
            SectionData(cells: [
                .init(contact: contacts[3]),
                .init(contact: contacts[4])
            ]),
            SectionData(cells: [
                .init(contact: contacts[5]),
                .init(contact: contacts[6])
            ]),
            SectionData(cells: [
                .init(contact: contacts[7]),
                .init(contact: contacts[8]),
                .init(contact: contacts[9])
            ])
        ]
    }
    
    var contacts: [Contact] = []
    
    private func createContacts(){
        let contact1 = Contact(name: "Albert",lastname: "Akhmadiev😎😏😎", number: "8 (987) 180-26-56", image: #imageLiteral(resourceName: "1.jpg"))
        contacts.append(contact1)
        
        let contact2 = Contact(name: "Sabina",lastname: "Alikilicheva😌", number: "8 (999) 341-89-62", image: #imageLiteral(resourceName: "2"))
        contacts.append(contact2)
        
        let contact3 = Contact(name: "Milana",lastname: "Amirova🥰", number: "8 (917) 990-82-88", image: #imageLiteral(resourceName: "3.jpg"))
        contacts.append(contact3)
        
        let contact4 = Contact(name: "Ilsaf",lastname: "Ilgamov💩", number: "8 (927) 290-11-77", image: #imageLiteral(resourceName: "4"))
        contacts.append(contact4)
        
        let contact5 = Contact(name: "Maxim",lastname: "Ivanov🥴", number: "8 (111) 111-11-11", image: #imageLiteral(resourceName: "10"))
        contacts.append(contact5)
        
        let contact6 = Contact(name: "Rishat",lastname: "Latypov🤪", number: "8 (987) 244-46-24", image: #imageLiteral(resourceName: "6.jpg"))
        contacts.append(contact6)
        
        let contact7 = Contact(name: "Nikita",lastname: "Lyapustin🤡", number: "8 (222) 322-13-99", image: #imageLiteral(resourceName: "7.jpg"))
        contacts.append(contact7)
        
        let contact8 = Contact(name: "Nastya",lastname: "Semenova🤫😏", number: "8 (800) 555-35-35", image: #imageLiteral(resourceName: "8"))
        contacts.append(contact8)
        
        let contact9 = Contact(name: "Nikita",lastname: "Sosyuk🤯", number: "8 (222) 322-13-99", image: #imageLiteral(resourceName: "9"))
        contacts.append(contact9)
        
        let contact10 = Contact(name: "Ramir",lastname: "Sultanov🤓", number: "8 (111) 111-11-11", image: #imageLiteral(resourceName: "5"))
        contacts.append(contact10)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionData = sectionsData?[section] else { return 0 }
        
        return sectionData.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = sectionsData?[indexPath.section]
        else { fatalError("Attempt to get data while it is not loaded") }
        
        return basicCell(for: indexPath, from: tableView, name: cellData.cells[indexPath.row].contact.name, lastname: cellData.cells[indexPath.row].contact.lastname)
    }
    
    private func basicCell(for indexPath: IndexPath, from tableView: UITableView, name: String, lastname: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "basic",
            for: indexPath
        )
        cell.textLabel?.text = "\(name) \(lastname)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "A"
        case 1:
            return "I"
        case 2:
            return "L"
        case 3:
            return "S"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        guard let detailViewController: DetailViewController
                = storyboard?.instantiateViewController(identifier: "detail")
        else { return }
        
        guard let contact = sectionsData?[indexPath.section].cells[indexPath.row].contact else {return}
        
        detailViewController.loadViewIfNeeded()
        detailViewController.setContact(contact: contact)
        show(detailViewController, sender: nil)
    }
}

struct Contact{
    let name: String
    let lastname: String
    let number: String
    let image: UIImage!
}

//
//  ViewController.swift
//  hw4
//
//  Created by Arina Goncharova on 30.06.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    private var data: [Character] = [
        Character(id: UUID(), name: "Rick Sanchez", status: .alive, species: "Cybernetically Enhanced Human", gender: .male, location: "Seattle, Washington", image: UIImage(named: "Rick_Sanchez.jpeg")!),
        Character(id: UUID(), name: "Morty Smith", status: .alive, species: "Human Vampire (formerly)", gender: .male, location: "Seattle, Washington", image: UIImage(named: "Morty_Smith.jpeg")!),
        Character(id: UUID(), name: "Jerry Smith", status: .alive, species: "Human", gender: .male, location: "Seattle, Washington", image: UIImage(named: "Jerry_Smith.jpeg")!),
        Character(id: UUID(), name: "Summer Smith", status: .alive, species: "Human", gender: .female, location: "Seattle, Washington", image: UIImage(named: "Summer_Smith.jpeg")!),
        Character(id: UUID(), name: "Beth Smith", status: .alive, species: "Human", gender: .female, location: "Muskegon, Michigan", image: UIImage(named: "Beth_Smith.png")!),
        Character(id: UUID(), name: "Jessica", status: .alive, species: "Human", gender: .female, location: "Seattle, Washington", image: UIImage(named: "Jessica.jpeg")!),
        Character(id: UUID(), name: "Mr. Goldenfold", status: .alive, species: "Human", gender: .male, location: "Harry Herpson High School", image: UIImage(named: "Mr. Goldenfold.jpeg")!),
        Character(id: UUID(), name: "Tammy Gueterman", status: .alive, species: "Human", gender: .female, location: "Seattle, Washington", image: UIImage(named: "Tammy_Gueterman.png")!)
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }


//MARK:  -UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let characterViewController = storyboard?.instantiateViewController(
            withIdentifier: "CharacterViewController"
        ) as? CharacterViewController else { return }
        
        characterViewController.delegate = self
        
        present(characterViewController, animated: true)
        
        characterViewController.data = data[indexPath.row]
        
        print("you tapped me!")
    }

// MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let characterCell = tableView.dequeueReusableCell(withIdentifier:
                "CharacterTableViewCell") as? TableViewCell
        else { return UITableViewCell() }
        
        let cellData = data[indexPath.row]
        
        characterCell.setUpData(cellData)
        
        return characterCell
        
    }
}

extension ViewController: CharacterViewControllerDelegate {
    
    func deletePersonData(with id: UUID) {
        if let index = data.firstIndex(where: { $0.id == id }) {
            data.remove(at: index)
            tableView.reloadData()
        }
        dismiss(animated: true)
    }
    
    func updateCharacterName(with id: UUID, name newName: String) {
        if let index = data.firstIndex(where: { $0.id == id }){
            data[index].name = newName
            tableView.reloadData()
        }
        
    }
    func updateCharacterLocation(with id: UUID, location newLocation: String) {
        if let index = data.firstIndex(where: { $0.id == id }){
            data[index].location = newLocation
            tableView.reloadData()
        }
        
    }
}


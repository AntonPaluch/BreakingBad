//
//  CharactersViewController.swift
//  BreakingBadApp
//
//  Created by Pandos on 01.03.2021.
//

import UIKit

class CharactersViewController: UITableViewController {

    var characters: [Character] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
     
//        fetchCharacters()
        
        fetchData(from: "https://www.breakingbadapi.com/api/characters")
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterCell
        let character = characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailVC else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailVC.character = characters[indexPath.row]
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) {  characters in
//            self.characters.append(characters)
            self.characters = characters
            self.tableView.reloadData()
        }
    }
    
    
}


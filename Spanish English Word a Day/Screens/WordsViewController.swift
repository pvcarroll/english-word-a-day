//
//  WordsViewController.swift
//  Spanish English Word a Day
//
//  Created by Paul Carroll on 12/26/18.
//  Copyright © 2018 Paul Carroll. All rights reserved.
//

import UIKit

class WordsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension WordsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Palabras para aprender / Words to learn"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Words.words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let word = Words.words[indexPath.row]
        cell.textLabel?.text = "\(word.english) (\(word.spanish))"
        cell.accessoryType = .checkmark
        return cell
    }
}

extension WordsViewController: UITableViewDelegate {
    
}

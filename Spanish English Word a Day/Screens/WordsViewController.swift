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
    @IBOutlet weak var saveButton: UIButton!
    
    var english = false
    private var deselectedWords = Set<String>()
    
    @IBAction func saveButton(_ sender: UIButton) {
        UserDefaults.standard.set(Array(deselectedWords), forKey: AppConstants.deselectedWordsKey)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let saveButtonText = (english ? Messages.buttonText.english : Messages.buttonText.spanish)
        saveButton.setTitle(saveButtonText, for: .normal)
        saveButton.layer.shadowOpacity = 0.2
        saveButton.layer.masksToBounds = false
        
        if let savedWords = UserDefaults.standard.array(forKey: AppConstants.deselectedWordsKey) as? [String] {
            deselectedWords = Set(savedWords)
        }
    }
}

extension WordsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return english ? Messages.header.english : Messages.header.spanish
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Words.words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.selectionStyle = .none
        let word = Words.words[indexPath.row]
        cell.textLabel?.text = "\(word.english) (\(word.spanish))"
        
        if deselectedWords.contains(word.english) {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
        return cell
    }
}

extension WordsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        deselectedWords.remove(Words.words[indexPath.row].english)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
        deselectedWords.insert(Words.words[indexPath.row].english)
    }
}

fileprivate struct Messages {
    static let header = Word(english: "Words to learn", spanish: "Palabras para aprender")
    static let buttonText = Word(english: "SAVE", spanish: "SALVAR")
}

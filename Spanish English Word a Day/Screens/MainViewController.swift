//
//  MainViewController.swift
//  Spanish English Word a Day
//
//  Created by Paul Carroll on 12/14/18.
//  Copyright © 2018 Paul Carroll. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var wordsBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var languageControl: UISegmentedControl!
    @IBOutlet weak var mainMessageLabel: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var setupNotificationsButton: UIButton!
    
    private var selectedLanguageIndex = 0
    
    @IBAction func switchLanguage(_ sender: UISegmentedControl) {
        selectedLanguageIndex = sender.selectedSegmentIndex
        updateStrings(selectedSegmentIndex: sender.selectedSegmentIndex)
    }
    
    @IBAction func setupNotifications(_ sender: UIButton) {
        Notifications().setup(notificationTime: self.timePicker.date, completion: {
            let title: String
            let message: String
            let okMessage: String
            if self.selectedLanguageIndex == 0 {
                title = Messages.notificationsScheduledTitle.spanish
                message = Messages.notificationsScheduledBody.spanish
                okMessage = Messages.ok.spanish
            } else {
                title = Messages.notificationsScheduledTitle.english
                message = Messages.notificationsScheduledBody.english
                okMessage = Messages.ok.english
            }
            let alertController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: okMessage, style: .default, handler: nil)
            alertController.addAction(okAction)
            DispatchQueue.main.async {
                self.present(alertController, animated: true)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Messages.title.spanish
        wordsBarButtonItem.title = Messages.words.spanish
        mainMessageLabel.text = Messages.mainMessage.spanish
        self.setupNotificationsButton.layer.cornerRadius = 10
        self.setupNotificationsButton.layer.borderWidth = 1
        self.setupNotificationsButton.layer.borderColor = UIColor(red: 0.20, green: 0.29, blue: 0.81, alpha: 1.0).cgColor
    }
    
    private func updateStrings(selectedSegmentIndex: Int) {
        if selectedSegmentIndex == 0 {
            title = Messages.title.spanish
            wordsBarButtonItem.title = Messages.words.spanish
            mainMessageLabel.text = Messages.mainMessage.spanish
            setupNotificationsButton.setTitle(Messages.setupNotifications.spanish, for: .normal)
        } else {
            title = Messages.title.english
            wordsBarButtonItem.title = Messages.words.english
            mainMessageLabel.text = Messages.mainMessage.english
            setupNotificationsButton.setTitle(Messages.setupNotifications.english, for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        (segue.destination as? WordsViewController)?.english = (selectedLanguageIndex == 1)
    }
}

fileprivate struct Messages {
    static let title = Word(english: "Word a Day", spanish: "Palabra al dia")
    static let words = Word(english: "Words", spanish: "Palabras")
    static let mainMessage = Word(english: "Pick a time and receive daily notifications with an English word",
                                  spanish: "Elija una hora y reciba notificaciones diarias con una palabra en inglés")
    static let setupNotifications = Word(english: "Setup Notifications", spanish: "Configurar Notificaciones")
    static let notificationsScheduledTitle = Word(english: "Notifications Scheduled", spanish: "Notificaciones Programadas")
    static let notificationsScheduledBody = Word(english: "You will receive 1 notification a day for the next 63 days.",
                                                 spanish: "Recibirá 1 notificación al día durante los próximos 63 días.")
    static let ok = Word(english: "OK", spanish: "Aceptar")
}

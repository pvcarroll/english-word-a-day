//
//  ViewController.swift
//  Spanish English Word a Day
//
//  Created by Paul Carroll on 12/14/18.
//  Copyright © 2018 Paul Carroll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordsBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var languageControl: UISegmentedControl!
    @IBOutlet weak var mainMessageLabel: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var setupNotificationsButton: UIButton!
    
    var selectedLanguageIndex = 0
    
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
                title = Messages.NotificationsScheduledTitle.spanish.rawValue
                message = Messages.NotificationsScheduledBody.spanish.rawValue
                okMessage = Messages.Ok.spanish.rawValue
            } else {
                title = Messages.NotificationsScheduledTitle.english.rawValue
                message = Messages.NotificationsScheduledBody.english.rawValue
                okMessage = Messages.Ok.english.rawValue
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
        self.title = Messages.Title.spanish.rawValue
        wordsBarButtonItem.title = Messages.Words.spanish.rawValue
        mainMessageLabel.text = Messages.MainMessage.spanish.rawValue
        self.setupNotificationsButton.layer.cornerRadius = 10
        self.setupNotificationsButton.layer.borderWidth = 1
        self.setupNotificationsButton.layer.borderColor = UIColor(red: 0.20, green: 0.29, blue: 0.81, alpha: 1.0).cgColor
    }
    
    private func updateStrings(selectedSegmentIndex: Int) {
        if selectedSegmentIndex == 0 {
            title = Messages.Title.spanish.rawValue
            wordsBarButtonItem.title = Messages.Words.spanish.rawValue
            mainMessageLabel.text = Messages.MainMessage.spanish.rawValue
            setupNotificationsButton.setTitle(Messages.SetupNotifications.spanish.rawValue, for: .normal)
        } else {
            title = Messages.Title.english.rawValue
            wordsBarButtonItem.title = Messages.Words.english.rawValue
            mainMessageLabel.text = Messages.MainMessage.english.rawValue
            setupNotificationsButton.setTitle(Messages.SetupNotifications.english.rawValue, for: .normal)
        }
    }
}

struct Messages {
    enum Title: String {
        case english = "Word a Day"
        case spanish = "Palabra al dia"
    }
    
    enum Words: String {
        case english = "Words"
        case spanish = "Palabras"
    }
    
    enum MainMessage: String {
        case english = "Pick a time and receive daily notifications with an English word"
        case spanish = "Elija una hora y reciba notificaciones diarias con una palabra en inglés"
    }
    
    enum SetupNotifications: String {
        case english = "Setup Notifications"
        case spanish = "Configurar Notificaciones"
    }
    
    enum NotificationsScheduledTitle: String {
        case english = "Notifications Scheduled"
        case spanish = "Notificaciones Programadas"
    }
    
    enum NotificationsScheduledBody: String {
        case english = "You will receive 1 notification a day for the next 63 days."
        case spanish = "Recibirá 1 notificación al día durante los próximos 63 días."
    }
    
    enum Ok: String {
        case english = "OK"
        case spanish = "Aceptar"
    }
}

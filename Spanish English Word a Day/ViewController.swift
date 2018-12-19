//
//  ViewController.swift
//  Spanish English Word a Day
//
//  Created by Paul Carroll on 12/14/18.
//  Copyright © 2018 Paul Carroll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var languageControl: UISegmentedControl!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var setupNotificationsButton: UIButton!
    
    @IBAction func setupNotifications(_ sender: UIButton) {
        print("date = \(self.timePicker.date)")
        Notifications().setup(notificationTime: self.timePicker.date, completion: {
            let alertController = UIAlertController(
                title: "Notificaciones Programadas (Notifications Scheduled)",
                message: "Recibirá 1 notificación al día durante los próximos 63 días.  (You will receive 1 notification a day for the next 63 days)",
                preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Aceptar (OK)", style: .default, handler: nil)
            alertController.addAction(okAction)
            DispatchQueue.main.async {
                self.present(alertController, animated: true)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Learn a Word a Day"
        self.setupNotificationsButton.layer.cornerRadius = 10
        self.setupNotificationsButton.layer.borderWidth = 1
        self.setupNotificationsButton.layer.borderColor = UIColor(red:0.20, green:0.29, blue:0.81, alpha:1.0).cgColor
    }
}

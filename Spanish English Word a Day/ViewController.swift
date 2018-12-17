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
        Notifications().setup(notificationTime: self.timePicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Learn a Word a Day"
        self.setupNotificationsButton.layer.cornerRadius = 10
        self.setupNotificationsButton.layer.borderWidth = 1
        self.setupNotificationsButton.layer.borderColor = UIColor(red:0.20, green:0.29, blue:0.81, alpha:1.0).cgColor
    }
}

//
//  Notifications.swift
//  Spanish English Word a Day
//
//  Created by Paul Carroll on 12/15/18.
//  Copyright © 2018 Paul Carroll. All rights reserved.
//

import Foundation
import UserNotifications

class Notifications {
    
    func setup(notificationTime: Date) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if let err = error {
                print("ERROR Requesting Authorization = \(err)")
                return
            }
            self.schedule(time: notificationTime)
        }
    }
    
    func schedule(time: Date) {
        let startingDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: time)
        let englishWords = Array(Dictionary.nouns.keys)
        
        for (i, engWord) in englishWords.enumerated() {
            let content = UNMutableNotificationContent()
            content.title = "title"
            content.subtitle = "subtitle"
            content.body = "\(engWord) - \(Dictionary.nouns[engWord] ?? "")"
            let trigger = UNCalendarNotificationTrigger(dateMatching: startingDateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: "1", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
                if let err = error {
                    print ("ERROR adding notification request: \(err)")
                    return
                }
                // TODO: Show success modal
            })
        }
    }
}

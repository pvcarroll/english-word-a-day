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
    
    func setup(notificationTime: Date, completion: @escaping () -> ()) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if let err = error {
                print("ERROR Requesting Authorization = \(err)")
                return
            }
            self.schedule(time: notificationTime, completion: completion)
        }
    }
    
    func schedule(time: Date, completion: @escaping () -> ()) {
        let startingDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: time)
        let englishWords = Array(Dictionary.nouns.keys)
        
        for i in 0..<englishWords.count {
            let englishWord = englishWords[i]
            let spanishWord = Dictionary.nouns[englishWord] ?? "ay-ay-ay no hay palabra"
            let content = UNMutableNotificationContent()
            content.title = self.getTitle(hour: startingDateComponents.hour ?? 12)
            content.subtitle = "palabra para el dia (word for the day):"
            content.body = "\(englishWord) - \(spanishWord)"
            let trigger = UNCalendarNotificationTrigger(dateMatching: startingDateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: "1", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
                if let err = error {
                    print ("ERROR adding notification request: \(err)")
                    return
                }
                if i == englishWords.count - 1 {
                    completion()
                }
            })
        }
    }
    
    func getTitle(hour: Int) -> String {
        switch hour {
        case 0...11: return "Buenos Días (Good Morning)"
        case 12...18: return "Buenas Tardes (Good Afternoon)"
        case 19...24: return "Buenas Noches (Good Night)"
        default: return "Buenos Días (Good Morning)"
        }
    }
}

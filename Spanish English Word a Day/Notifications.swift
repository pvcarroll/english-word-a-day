//
//  Notifications.swift
//  Spanish English Word a Day
//
//  Created by Paul Carroll on 12/15/18.
//  Copyright © 2018 Paul Carroll. All rights reserved.
//

import UIKit
import UserNotifications

class Notifications {
    
    func setup(notificationTime: Date, completion: @escaping () -> ()) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if let err = error {
                print("ERROR Requesting Authorization = \(err)")
                return
            }
            self.schedule(notificationDate: notificationTime, completion: completion)
        }
    }
    
    func schedule(notificationDate: Date, completion: @escaping () -> ()) {
        let firstNotificationDate: Date
        if notificationDate < Date() {
            firstNotificationDate = Calendar.current.date(byAdding: .day, value: 1, to: notificationDate) ?? notificationDate
        } else {
            firstNotificationDate = notificationDate
        }
        let englishWords = Array(Dictionary.nouns.keys)
        for i in 0..<englishWords.count {
            guard let nextDay = Calendar.current.date(byAdding: .day, value: i, to: firstNotificationDate) else { return }
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: nextDay)
            let englishWord = englishWords[i]
            let spanishWord = Dictionary.nouns[englishWord] ?? "ay-ay-ay no hay palabra"
            let content = UNMutableNotificationContent()
            content.title = self.getTitle(hour: dateComponents.hour ?? 12)
            content.subtitle = "palabra para el dia (word for the day):"
            content.body = "\(englishWord) - \(spanishWord)"
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: "notification-\(i)", content: content, trigger: trigger)
            
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

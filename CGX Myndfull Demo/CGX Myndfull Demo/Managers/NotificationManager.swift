//
//  NotificationManager.swift
//  CGX Myndfull Demo
//
//  Created by Roman on 23.12.2023.
//

import UIKit
import MediaPlayer

let notificationName = Notification.Name("NotificationManager")

final class NotificationManager {
    
    init() {
        subscribe()
    }

    private func subscribe() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleEvent(notification:)),
                                               name: notificationName,
                                               object: nil)
    }
    
    @objc private func handleEvent(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let id = userInfo["id"] as? String
        let percentage = userInfo["percentage"] as? String
        
        guard let id = id, let percentage = percentage else { return }
        applyFinalLogic(with: id, percentage: percentage)
    }
    
    private func applyFinalLogic(with id: String, percentage: String) {
        switch id {
        case TimerType.A.rawValue:
            guard let percentageValue = Float(percentage), percentageValue >= 20 else { return }
            UIScreen.main.brightness = CGFloat(percentageValue / 100)
        case TimerType.B.rawValue:
            guard let percentageValue = Float(percentage) else { return }
            MPVolumeView.setVolume(Float(percentageValue / 100.0))
        case TimerType.C.rawValue: break
            // TODO:
        default: break
        }
    }
}

//
//  TimerInfo.swift
//  CGX Myndfull Demo
//
//  Created by Roman on 22.12.2023.
//

import SwiftUI

enum TimerType: String {
    case A = "A"
    case B = "B"
    case C = "C"
}

final class TimerInfo: ObservableObject, Identifiable, Hashable {
    
    private enum TimerDuration: Int {
        case A = 60
        case B = 90
        case C = 120
    }

    let id: String

    @Published var percentage: String = "0"
    @Published var isRunning = false {
        willSet {
            if newValue {
                startTimer()
            } else {
                stopTimer()
            }
        }
    }
    
    private var timerAction = Timer()
    private var counter: Int = 0 {
        willSet {
            switch id {
            case TimerType.A.rawValue:
                guard newValue <= TimerDuration.A.rawValue else {
                    isRunning = false
                    return
                }
                percentage = String(counter * 100 / TimerDuration.A.rawValue)
                print("percentage A - \(self.percentage)")
            case TimerType.B.rawValue:
                guard newValue <= TimerDuration.B.rawValue else {
                    isRunning = false
                    return
                }
                percentage = String(counter * 100 / TimerDuration.B.rawValue)
                print("percentage B - \(self.percentage)")
            case TimerType.C.rawValue:
                guard newValue <= TimerDuration.C.rawValue else {
                    isRunning = false
                    return
                }
                percentage = String(counter * 100 / TimerDuration.C.rawValue)
                print("percentage C - \(self.percentage)")
            default: break
            }
            
            sendNotification()
        }
    }
    
    init(id: String) {
        self.id = id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: TimerInfo, rhs: TimerInfo) -> Bool {
        lhs.id == rhs.id
    }
}

private extension TimerInfo {
    func startTimer() {
        timerAction = Timer.scheduledTimer(timeInterval: 1,
                                           target: self,
                                           selector: #selector(handlerTimer),
                                           userInfo: nil,
                                           repeats: true)
    }
    
    func stopTimer() {
        counter = 0
        percentage = "0"
        timerAction.invalidate()
    }
    
    @objc func handlerTimer() {
        counter += 1
    }
    
    func sendNotification() {
        NotificationCenter.default.post(name: notificationName,
                                        object: nil,
                                        userInfo: [
                                                    "id": self.id,
                                                    "percentage": self.percentage,
                                                  ])
    }
}

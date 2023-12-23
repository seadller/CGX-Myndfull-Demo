//
//  CGX_Myndfull_DemoApp.swift
//  CGX Myndfull Demo
//
//  Created by Roman on 22.12.2023.
//

import SwiftUI

@main
struct CGX_Myndfull_DemoApp: App {
    
    private var notifications = NotificationManager()
    
    var body: some Scene {
        WindowGroup {
            TimersListView()
        }
    }
}

//
//  CustomNavigationLink.swift
//  CGX Myndfull Demo
//
//  Created by Roman on 23.12.2023.
//

import SwiftUI

struct CustomNavigationLink: View {
    
    @ObservedObject var timer: TimerInfo
    
    var body: some View {
        NavigationLink(destination: TimerDetail(timerInfo: timer)) {
            Text("Timer " + timer.id + " - " + timer.percentage + "%")
            .padding()
            .frame(minWidth: 250)
            .border(.blue, width: 1)
        }
    }
}

//
//  TimersListView.swift
//  CGX Myndfull Demo
//
//  Created by Roman on 22.12.2023.
//

import SwiftUI

struct TimersListView: View {
    
    @ObservedObject private var timerA = TimerInfo(id: "A")
    @ObservedObject private var timerB = TimerInfo(id: "B")
    @ObservedObject private var timerC = TimerInfo(id: "C")
    
    var body: some View {
        NavigationStack {
            CustomNavigationLink(timer: timerA)
            CustomNavigationLink(timer: timerB)
            CustomNavigationLink(timer: timerC)
                .navigationTitle("Timer Manager")
        }
    }
}

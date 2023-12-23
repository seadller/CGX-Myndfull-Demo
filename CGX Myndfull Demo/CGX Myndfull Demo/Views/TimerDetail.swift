//
//  TimerDetail.swift
//  CGX Myndfull Demo
//
//  Created by Roman on 22.12.2023.
//

import SwiftUI

struct TimerDetail: View {
    
    @ObservedObject var timerInfo: TimerInfo
    
    var body: some View {
        VStack {
            Button {
                timerInfo.isRunning.toggle()
            } label: {
                Text(!timerInfo.isRunning ? "Start" : "Stop")
                    .padding()
                    .foregroundStyle(.white)
                    .frame(minWidth: 250)
                    .background(timerInfo.isRunning ? .red : .blue)
            }
            .padding()
            Text(timerInfo.percentage + "%")
                .font(.system(size: 36))
        }
        .padding()
    }
}


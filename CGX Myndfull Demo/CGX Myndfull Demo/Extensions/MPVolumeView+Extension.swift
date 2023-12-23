//
//  MPVolumeView+Extension.swift
//  CGX Myndfull Demo
//
//  Created by Roman on 23.12.2023.
//

import MediaPlayer

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            slider?.value = volume
        }
    }
}

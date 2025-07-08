//
//  BackgroundVideoView.swift
//  MyWeatherApp
//
//  Created by Atharv  on 08/07/25.
//


import SwiftUI
import AVKit

struct BackgroundVideoView: UIViewRepresentable {
    let player: AVPlayer

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = UIScreen.main.bounds
        view.layer.addSublayer(playerLayer)

        player.play()
        player.isMuted = true
        player.actionAtItemEnd = .none

        // Loop video
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in
            player.seek(to: .zero)
            player.play()
        }
        
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Nothing to update
    }
}

#Preview {
    if let url = Bundle.main.url(forResource: "sunny", withExtension: "mp4") {
        BackgroundVideoView(player: AVPlayer(url: url))
    } else {
        Text("Video not found")
    }
}



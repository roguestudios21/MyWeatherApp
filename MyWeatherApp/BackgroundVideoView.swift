import SwiftUI
import AVKit

struct BackgroundVideoView: UIViewRepresentable {
    let player: AVPlayer

    func makeUIView(context: Context) -> PlayerContainerView {
        let view = PlayerContainerView()
        view.updatePlayer(player)
        return view
    }

    func updateUIView(_ uiView: PlayerContainerView, context: Context) {
        uiView.updatePlayer(player)
    }
}

// Custom UIView to hold the AVPlayerLayer
class PlayerContainerView: UIView {
    private var playerLayer: AVPlayerLayer?

    func updatePlayer(_ player: AVPlayer) {
        // Remove old layer if exists
        playerLayer?.removeFromSuperlayer()

        // Create new layer
        let newLayer = AVPlayerLayer(player: player)
        newLayer.videoGravity = .resizeAspectFill
        newLayer.frame = bounds
        layer.addSublayer(newLayer)
        playerLayer = newLayer

        // Play
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
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }
}

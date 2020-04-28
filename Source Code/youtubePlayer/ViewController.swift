import UIKit
import AVKit
import XCDYouTubeKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: IBAction Event
extension ViewController {
    
    @IBAction func tappedOnYoutubeLogo(_ sender: Any) {
        self.playVideo()
    }
}

//MARK: Other Fuction
extension ViewController {
    
    func playVideo(){
        XCDYouTubeClient.default().getVideoWithIdentifier("TIOfN5QHmJE") { (video, error) in
            if let streamURLs = video?.streamURLs {
                if let streamURL = streamURLs[XCDYouTubeVideoQualityHTTPLiveStreaming] ?? streamURLs[XCDYouTubeVideoQuality.HD720.rawValue] ?? streamURLs[XCDYouTubeVideoQuality.medium360.rawValue] ?? streamURLs[XCDYouTubeVideoQuality.small240.rawValue]{
                    //Set AVPlayerViewController
                    let player = AVPlayer(url: streamURL)
                    let playerViewController = AVPlayerViewController()
                    playerViewController.player = player
                    //present AVPlayerViewController
                    self.present(playerViewController, animated: true) {
                        playerViewController.player?.play()
                    }
                }
            }
        }
    }
}


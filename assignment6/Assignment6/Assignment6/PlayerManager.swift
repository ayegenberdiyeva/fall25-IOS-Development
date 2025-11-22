import Foundation
import AVFoundation

final class PlayerManager: NSObject, AVAudioPlayerDelegate { // nsobject is for avaudioplayerdelegate
    static let shared = PlayerManager() // shared instance
    
    override private init() {} // private -> no other instances can exist
    
    private var audioPlayer: AVAudioPlayer?
    private(set) var isPlaying: Bool = false
    
    func load(fileName: String) throws { // no app crashes, not force unwrap
        stop() // stops previous track
        
        let components = fileName.split(separator: ".")
        let name = String(components[0])
        let ext = String(components[1])
        
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            throw NSError(domain: "PlayerManager",
                          code: -1,
                          userInfo: [NSLocalizedDescriptionKey : "File not found"])
        }
        
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.prepareToPlay()
        audioPlayer?.delegate = self  // playback finished detection
    }
    
    func play() {
        audioPlayer?.play()
        isPlaying = true
    }
    
    func pause() {
        audioPlayer?.pause()
        isPlaying = false
    }
    
    func stop() { // need to stop when loads new track, no overlapping
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
    }
    
    var duration: TimeInterval? {
        audioPlayer?.duration
    }
    
    var currentTime: TimeInterval {
        audioPlayer?.currentTime ?? 0
    }
    
    func seek(to seconds: TimeInterval) {
        audioPlayer?.currentTime = seconds
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        isPlaying = false
        
        NotificationCenter.default.post(
            name: NSNotification.Name("PlaybackFinished"),
            object: nil
        )
    }

}

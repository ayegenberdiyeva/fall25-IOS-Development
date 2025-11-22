import Foundation

struct Track {
    let id: UUID = UUID()
    let title: String
    let artist: String
    let coverImageName: String
    let audioFileName: String
    let duration: TimeInterval
    
    var formattedDuration: String {
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

enum RepeatMode {
    case off
    case repeatOne
}

import Foundation

struct Track: Decodable {
    var id: UUID = UUID()
    let title: String
    let artist: String
    let coverImageName: String
    let audioFileName: String
    let duration: TimeInterval
    
    let genres: [String]
    let credits: [String]
    let lyrics: String
    
    var formattedDuration: String {
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    enum CodingKeys: String, CodingKey {
            case id, title, artist, coverImageName, audioFileName, duration, genres, credits, lyrics
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = (try? container.decode(UUID.self, forKey: .id)) ?? UUID()
            self.title = try container.decode(String.self, forKey: .title)
            self.artist = try container.decode(String.self, forKey: .artist)
            self.coverImageName = try container.decode(String.self, forKey: .coverImageName)
            self.audioFileName = try container.decode(String.self, forKey: .audioFileName)
            self.duration = try container.decode(TimeInterval.self, forKey: .duration)
            self.genres = try container.decode([String].self, forKey: .genres)
            self.credits = try container.decode([String].self, forKey: .credits)
            self.lyrics = try container.decode(String.self, forKey: .lyrics)
        }
}

enum RepeatMode {
    case off
    case repeatOne
}

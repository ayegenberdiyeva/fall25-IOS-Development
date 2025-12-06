import Foundation

class TracksManager {
    static let shared = TracksManager()
    private init() {}
    
    var tracks: [Track] = [] 
    
}

import Foundation

enum Difficulty: String, CaseIterable, Codable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

enum BreakfastType: String, CaseIterable, Codable {
    case savory = "Savory"
    case sweet = "Sweet"
    case neutral = "Neutral"
}

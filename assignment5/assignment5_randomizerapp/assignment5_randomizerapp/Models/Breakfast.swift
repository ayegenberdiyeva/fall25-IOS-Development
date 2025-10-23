import Foundation

struct Breakfast: Codable {
    let id: UUID
    let title: String
    let imageName: String
    let ingredients: [Ingredient]
    let recipe: String
    let difficulty: Difficulty
    let prepTimeMinutes: Int
    let type: BreakfastType
}

import Foundation

final class Ingredient: Codable {
    let item: String
    let quantity: Double
    let unit: String
    
    init(item: String, quantity: Double, unit: String) {
        self.item = item
        self.quantity = quantity
        self.unit = unit
    }
    
    var displayText: String {
        let quantityString: String
        if quantity == floor(quantity) {
            quantityString = String(format: "%.0f", quantity)
        } else {
            quantityString = String(format: "%.2f", quantity)
        }
        return "\(quantityString) \(unit) \(item)"
    }
}

import Foundation

struct Product {
    let id: UUID
    let title: String
    let price: Double
    let description: String
    let category: Category
    
    enum Category: String {
        case Skincare
        case Makeup
        case Haircare
        case Fragrance
    }
    
    var displayPrice: String {
        return String(format: "$%.2f", price)
    }
    
    init(title: String, price: Double, description: String, category: Category) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.price = max(price, 0)
        self.category = category
    }
}

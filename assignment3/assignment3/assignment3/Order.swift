import Foundation

struct Order {
    let id: UUID
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: String
    
    init (from cart: ShoppingCart, shippingAddress: Address) {
        self.id = UUID()
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress.formattedAddress
    }
    
    var itemCount: Int {
        return items.count
    }
}

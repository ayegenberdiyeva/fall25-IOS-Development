import Foundation

struct CartItem {
    let product: Product
    var quantity: Int
    
    var subtotal: Double {
        return Double(quantity) * product.price
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        guard newQuantity >= 0 else { return }
        quantity = newQuantity
    }
    
    mutating func increaseQuantity(by amount: Int) {
        updateQuantity(quantity + amount)
    }
}

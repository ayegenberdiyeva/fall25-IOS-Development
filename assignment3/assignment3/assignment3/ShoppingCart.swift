import Foundation

class ShoppingCart {
    private(set) var items: [CartItem]
    var discountCode: String?
    
    init() {
        self.items = []
    }
    
    func addITem(product: Product, quantity: Int) {
        if let index = items.firstIndex(where: {$0.product.id == product.id}) {
            items[index].increaseQuantity(by: quantity)
        } else {
            items.append(CartItem(product: product, quantity: quantity))
        }
    }
    
    func removeItem(productId: UUID) {
        if let index = items.firstIndex(where: {$0.product.id == productId}) {
            items.remove(at: index)
        } else {
            // to-do error throwing
        }
    }
    
    func updateItemQuantity(productId: UUID, newQuantity: Int) {
        if let index = items.firstIndex(where: {$0.product.id == productId}) {
            if newQuantity > 0 {
                items[index].quantity = newQuantity
            } else {
                removeItem(productId: productId)
            }
        } else {
            // to-do error throwing
        }
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    var subtotal: Double {
        return items.reduce(0) { result, item in
            result + item.subtotal
        }
    }
    
    var discountAmount: Double {
        guard let discountCode = discountCode else { return 0 }
        guard let firstNumIndex = discountCode.firstIndex(where: { $0.isNumber }) else { return 0 }
        
        let numString = discountCode[firstNumIndex...]
        guard let numDouble = Double(String(numString)) else { return 0 }
        
        return numDouble * subtotal
    }
    
    var total: Double {
        return subtotal - discountAmount
    }
    
    var ItemCount: Int {
        return items.reduce(0) { $0 + $1.quantity }
    }
    
    var isEmpty: Bool {
        if ItemCount == 0 {
            return true
        } else {
            return false
        }
    }
}

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
//        items.reduce(0) { $0 + $1.quantity } - using .reduce()
        
        // .reduce(inititalValue) { (accumulator, element) in
        // return someFunction(for example accumulator + element.field) -> newAccumulator
        // }
        
        //items.reduce(ini value for accumulator -> 0) { (currentTotal, item (element from sequence we working with)) in
        // return currentTotal + item.quantity
        // }
        
        //after looping through all elements it returns final accumlated value.
        
        var itemCount: Int = 0 // using for loop
        for item in items {
            itemCount += item.quantity
        }
        return itemCount
    }
}

import Foundation

func testCart() {
    let cleanser = Product(title: "Cleanser", price: 19.99, description: "For all skin types", category: .Skincare)
    let highlighter = Product(title: "Highlighter", price: 14.99, description: "A radiant glow", category: .Makeup)
    let parfum = Product(title: "Parfum", price: 79.99, description: "A scent for all occasions", category: .Fragrance)

    let cart = ShoppingCart()
    cart.addITem(product: cleanser, quantity: 1)
    cart.addITem(product: highlighter, quantity: 2)
    cart.addITem(product: parfum, quantity: 3)

    print("Total: \(cart.total)")
    print("Item count: \(cart.ItemCount)")

    cart.discountCode = "SUMMER20"
    print("Total with discount: \(cart.total)")
    
    cart.removeItem(productId: highlighter.id)
    
    func modifyCart(_ cart: ShoppingCart) {
        cart.addITem(product: cleanser, quantity: 1)
    }
    modifyCart(cart)
    
    let item1 = CartItem(product: cleanser, quantity: 1)
    var item2 = item1
    item2.updateQuantity(3)
    
    let address = Address(street: "St. 1", city: "City", zipCode: "CODE123", country: "Country")
    let order = Order(from: cart, shippingAddress: address)
    
    cart.clearCart()
    
    print("Order items count: \(order.items.count)")
    print("Cart items count: \(cart.ItemCount)")
}


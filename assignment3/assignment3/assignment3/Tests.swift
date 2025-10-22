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
    print("Item count: \(cart.itemCount)")

    cart.discountCode = "SUMMER20"
    print("Total with discount: \(cart.total)\n")
    
    cart.removeItem(productId: highlighter.id)
    
    func modifyCart(_ cart: ShoppingCart) {
        cart.addITem(product: cleanser, quantity: 1)
    }
    modifyCart(cart)
    
    let item1 = CartItem(product: cleanser, quantity: 1)
    var item2 = item1
    item2.updateQuantity(3)
    print("Item1 quantity: \(item1.quantity)")
    print("Item2 quantity: \(item2.quantity)\n")
    
    let address = Address(street: "St. 1", city: "City", zipCode: "CODE123", country: "Country")
    let order = Order(from: cart, shippingAddress: address)
    
    cart.clearCart()
    
    print("Order items count: \(order.itemCount)")
    print("Cart items count: \(cart.itemCount)\n")
    
    // User class implementation
    
    let user = User(name: "Amina", email: "a_yegenberdiyeva@kbtu.kz")
    let userCart = ShoppingCart()
    let order1 = Order(from: userCart, shippingAddress: address)
    user.placeOrder(order1)
    
    userCart.addITem(product: cleanser, quantity: 2)
    userCart.addITem(product: highlighter, quantity: 1)
    userCart.discountCode = "SALE5"
    
    let order2 = Order(from: userCart, shippingAddress: address)
    user.placeOrder(order2)
    
    let order3 = Order(from: cart, shippingAddress: address)
    user.placeOrder(order3)
    
    user.printOrderHistory()
    
    print("Total spent by \(user.name): \(user.totalSpent)")
}


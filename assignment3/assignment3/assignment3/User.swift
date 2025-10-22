import Foundation

class User {
    let id: UUID
    let name: String
    let email: String
    private(set) var orderHistory: [Order]
    
    init(name: String, email: String) {
        self.id = UUID()
        self.name = name
        self.email = email
        self.orderHistory = []
    }
    
    func placeOrder(_ order: Order) {
        orderHistory.append(order)
    }
    
    var totalSpent: Double {
        return orderHistory.reduce(0) { $0 + $1.total
        }
    }
    
    var orderCount: Int {
        return orderHistory.count
    }
    
    func printOrderHistory() {
        print("Order History for \(name):")
        if orderHistory.isEmpty {
            print("No orders placed yet.")
        } else {
            for order in orderHistory {
                print ("""
                    Order ID: \(order.id)
                    Total: \(String(format: "$%.2f", order.total))
                    Items: \(order.itemCount)
                    Date: \(order.timestamp)
                    """)
            }
        }
    }
}

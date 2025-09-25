import Foundation

func showMenuProblem4() {
    print("Shopping List Manager:\n 1. Add an item\n 2. Remove an item\n 3. Display shopping list\n 4. Exit\nEnter your choice:")
}

func shoppingListApp() {
    var shoppingList: [String] = []
    
    var isRunning = true
    
    while isRunning {
        showMenuProblem4()
        
        if let choiceString = readLine(), let choice = Int(choiceString) {
            switch choice {
            case 1:
                print("Enter item to add:")
                if let itemToAdd = readLine() {
                    shoppingList.append(itemToAdd)
                }
            case 2:
                print("Enter item to remove:")
                if let itemToRemove = readLine(), let index = shoppingList.firstIndex(of: itemToRemove) {
                    shoppingList.remove(at: index)
                }
            case 3:
                print("Shopping list:")
                shoppingList.forEach { print($0) }
            case 4:
                print("Exiting")
                isRunning = false
            default:
                print("Invalid choice.")
            }
        } else {
            print("Invalid choice.")
        }
    }
}



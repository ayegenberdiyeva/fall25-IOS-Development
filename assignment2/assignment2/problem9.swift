import Foundation

func simpleCalculator() {
    var isCalculating = true
    while isCalculating {
        print("Choose ooperation (+, -, *, /) or 'done':", terminator: " ")
        let operation = readLine() ?? ""
        
        if operation == "done" {
            isCalculating = false
            continue
        }
        
        print("Enter first number:", terminator: " ")
        let firstNumberString = readLine() ?? ""
        print("Enter second number:", terminator: " ")
        let secondNumberString = readLine() ?? ""
        
        guard let firstNumber = Double(firstNumberString),
              let secondNumber = Double(secondNumberString) else {
            print("Invalid input")
            return
        }

        var result: Double = 0
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "*":
            result = firstNumber * secondNumber
        case "/":
            guard secondNumber != 0 else {
                print("Second number cannot be 0")
                return
            }
            result = firstNumber / secondNumber
        case "done":
            isCalculating = false
        default:
            print("Invalid operation")
            return
        }
        
        print("Result: \(result)")
    }
}

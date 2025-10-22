import Foundation

func fizzBuzz() {
    for num in 1...100 {
        var result = ""
        if num % 3 == 0 { result += "Fizz" }
        if num % 5 == 0 { result += "Buzz" }
        print(result.isEmpty ? num : result)
    }
}

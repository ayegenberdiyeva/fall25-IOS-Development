import Foundation

func showMenu() {
    print("Choose the task you want to run:")
    print("1. FizzBuzz\n 2. Prime Numbers\n 3. Temperature Converter\n 4. Shopping List Manager\n 5. Word Frequency Counter\n 6. Fibonacci Sequence\n 7. Grade Calculator\n 8. Palindrome Checker\n 9. Simple Calculator\n 10. Unique Characters\n 11. End")

}

var shouldRun = true

while shouldRun {
    showMenu()
    print("Enter your choice:", terminator: "")
    if let input  = readLine(), let choice = Int(input) {
        switch choice {
        case 1:
            print("Problem 1: FizzBuzz")
            fizzBuzz()
            print("End of Problem 1\n")
        case 2:
            print("Problem 2: Prime Numbers")
            for i in 1...100 {
                if isPrime(i) {
                    print(i)
                }
            }
            print("End of Problem 2\n")
        case 3:
            print("Problem3: Temperature Converter")
            let userInput : String = readLine()!
            temperatureConverter(userInput)
            print("End of Problem 3\n")
        case 4:
            print("Problem 4: Shopping List Manager")
            shoppingListApp()
            print( "End of Problem 4\n")
        case 5:
            print("Problem 5: Word Frequency Counter")
            print("Enter a sentence: ", terminator: "")
            if let sentenceInput  = readLine() {
                wordFrequencyCounter(sentenceInput)
            }
            print( "End of Problem 5\n")
        case 6:
            print("Problem 6: Fibonacci Sequence")
            print("Enter a number: ", terminator: "")
            if let numberInput  = readLine(), let number = Int(numberInput) {
                print(fibonacci(number))
            }
            print( "End of Problem 6\n")
        case 7:
            print("Problem 7: Grade Calculator")
            let data = getData()
            gradeCalculator(data)
            print( "End of Problem 7\n")
        case 8:
            print("Problem 8: Palindrome Checker")
            print("Enter a word: ", terminator: "")
            if let wordInput  = readLine() {
                if isPalindrome(wordInput) {
                    print("true")
                } else {
                    print("false")
                }
            }
            print("End of Problem 8\n")
        case 9:
            print("Problem 9: Simple Calculator")
            simpleCalculator()
            print( "End of Problem 9\n")
        case 10:
            print("Problem 10: Unique Characters")
            print("Enter the text: ", terminator: "")
            if let textInput  = readLine() {
                if hasUniqueCharacters(textInput) {
                    print("true")
                } else {
                    print("false")
                }
            }
            print( "End of Problem 10\n")
        case 11:
            print("Exiting")
            shouldRun = false
        default:
            print("Invalid input. Please try again.")
        }
    } else {
        print( "Invalid input. Please try again.")
    }
}


import Foundation

func isPrime(_ n: Int) -> Bool {
    if n <= 1 {
        return false
    } else {
        var isPrime = true
        for i in 2..<Int(sqrt(Double(n)) + 1) {
            if n % i == 0 {
                isPrime = false
                break
            }
        }
        return isPrime
    }
}

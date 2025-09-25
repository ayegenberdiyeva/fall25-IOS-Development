import Foundation

func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 {
        return []
    }
    
    var result: [Int] = []
    for i in 0..<n {
        result.append(i < 2 ? i : result[i - 1] + result[i - 2])
    }
    return result
}

import Foundation

func isPalindrome(_ text: String) -> Bool {
    var filteredText = text
        .lowercased()
        .components(separatedBy: CharacterSet.alphanumerics.inverted)
        .filter { !$0.isEmpty }
        .joined()
    
    var leftIndex = filteredText.startIndex
    var rightIndex = filteredText.index(before: filteredText.endIndex)
    
    while leftIndex < rightIndex {
        if filteredText[leftIndex] != filteredText[rightIndex] {
            return false
        }
        leftIndex = filteredText.index(after: leftIndex)
        rightIndex = filteredText.index(before: rightIndex)
    }
    return true
}

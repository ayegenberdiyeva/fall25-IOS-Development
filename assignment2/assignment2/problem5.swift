import Foundation

func wordFrequencyCounter(_ sentence: String){
    var wordFrequency: [String: Int] = [:]
    let words = sentence
        .lowercased()
        .components(separatedBy: CharacterSet.alphanumerics.inverted)
        .filter { !$0.isEmpty }
    for word in words {
        wordFrequency[String(word), default: 0] += 1
    }
    print(wordFrequency)
}

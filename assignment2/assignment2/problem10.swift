import Foundation

func hasUniqueCharacters(_ text: String) -> Bool {
    for i in text {
        if text.filter({$0 == i}).count > 1 {
            return false
        }
    }
    return true
}


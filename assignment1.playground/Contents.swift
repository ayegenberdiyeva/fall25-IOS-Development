import Foundation

//step 1
let fisrstName = "Amina"
let lastName = "Yegnb"
let birthDateComponents = DateComponents(year: 2004, month: 11, day: 21)
var age: Int
var isStudent: Bool
var height: Double

func calculateAge(dateComponents: DateComponents) -> Int {
    let today = Date()
    let birthDate = Calendar.current.date(from: dateComponents)
    return Calendar.current.dateComponents([.year], from: birthDate!, to: today).year ?? 0
}

func checkStudentStatus(age: Int) -> Bool {
    return age >= 18 && age <= 22
}

func calculateHeight() -> Double {
    return 1.76
}

age = calculateAge(dateComponents: birthDateComponents)
isStudent = checkStudentStatus(age: age)
height = calculateHeight()

var firstPart = "My name is \(fisrstName) \(lastName). I am \(age) years old. My height is \(height) meters. I am \(isStudent ? "a student" : "not a student")."

//step 2

var hobbies = ["Drawing", "Reading", "Running", "Coding"]
var favNumber: Int?

func countHobbies(_ hobbies: [String]) -> Int {
    return hobbies.count
}

func isCreativeHobby(_ hobby: String) -> Bool {
    let creativeHobbies = ["Drawing", "Writing", "Music"]
    return creativeHobbies.contains(hobby)
}

let numberOfHobbies = countHobbies(hobbies)
let mainHobby = hobbies[0]
let isHobbyCreative = isCreativeHobby(mainHobby)

var secondPart = "I have \(numberOfHobbies) hobbies: \(hobbies.joined(separator: ", ")). My main hobby is \(mainHobby), which is \(isHobbyCreative ? "creative" : "not creative")."

if let favoriteNumber = favNumber {
    secondPart.append("My favorite number is \(favoriteNumber).")
} else {
    secondPart.append("I don't have favorite number.")
}

let lifeStory = firstPart + "\n" + secondPart
print(lifeStory)

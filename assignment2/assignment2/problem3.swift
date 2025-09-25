import Foundation

func temperatureConverter(_ input: String) {
    let temp = Int(input.split(separator: " ")[0])!
    print("You entered: \(input)")
    if input.last == "C" {
        let f : Double = (Double(temp) * 9.0 / 5.0) + 32.0
        print("Fahrenheit: \(f) F")
        
        let k : Double = Double(temp) + 273.15
        print( "Kelvin: \(k) K")
    } else if input.last == "F" {
        let c : Double = (Double(temp) - 32.0) * 5.0 / 9.0
        print("Celsius: \(c) C")
        
        let k : Double = (Double(temp) - 32.0) * 5.0 / 9.0 + 273.15
        print("Kelvin: \(k) K")
    } else if input.last == "K" {
        let c : Double = Double(temp) - 273.15
        print("Celsius: \(c) C")
        
        let f : Double = (Double(temp) - 273.15) * 9.0 / 5.0 + 32.0
        print("Fahrenheit: \(f) F")
    }
}

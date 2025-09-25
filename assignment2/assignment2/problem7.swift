import Foundation

func gradeCalculator(_ scores: [String: Double]) {
    let ave = scores.values.reduce(0, +) / Double(scores.values.count)
    let max = scores.values.max() ?? 0
    let min = scores.values.min() ?? 0
    
    print("Average Scores: \(ave)\n Highest Score: \(max)\n Lowest Score: \(min)\n")
    for (name, score) in scores {
        if score >= ave {
            print("\(name): \(score) (Above Average)")
        } else {
            print( "\(name): \(score) (Below Average)")
        }
    }
}

func getData() -> [String: Double] {
    var scores: [String: Double] = [:]
    print("Enter student name and score, or 'done' to finish:")
    while let line = readLine(), line != "done" {
        let components = line.split(separator: " ")
        guard components.count == 2, let score = Double(components[1]) else {
            print( "Invalid input. Please try again.")
            continue
        }
        scores [String(components[0])] = score
    }
    
    return scores
}

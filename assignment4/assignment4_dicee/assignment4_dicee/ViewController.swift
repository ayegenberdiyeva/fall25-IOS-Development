import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lhsDice: UIImageView!
    @IBOutlet weak var rhsDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    let diceImages: [UIImage] = [#imageLiteral(resourceName: "inverted-dice-1"), #imageLiteral(resourceName: "inverted-dice-2"), #imageLiteral(resourceName: "inverted-dice-3"), #imageLiteral(resourceName: "inverted-dice-4"), #imageLiteral(resourceName: "inverted-dice-5"), #imageLiteral(resourceName: "inverted-dice-6")]
//    let diceImageEnum: [UIImage] = [ .invertedDice1, .invertedDice2, .invertedDice3, .invertedDice4, .invertedDice5, .invertedDice6]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lhsDice.image = diceImages[1]
        rhsDice.image = diceImages[4]
        rollButton.layer.cornerRadius = 12
        rollButton.backgroundColor = .systemBlue
        rollButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func rollDiceDidTap(_ sender: UIButton) {
        rollDice()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollDice()
        }
    }
    
    private func rollDice() {
        lhsDice.image = diceImages.randomElement()
        rhsDice.image = diceImages.randomElement()
    }
}


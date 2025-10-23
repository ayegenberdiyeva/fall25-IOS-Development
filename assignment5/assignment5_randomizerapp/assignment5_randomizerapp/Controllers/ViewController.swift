import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var breakfastImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var randomizeButton: UIButton!
    
    @IBOutlet weak var detailsContainer: UIView!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    private var breakfasts: [Breakfast] = mockBreakfasts
    private var current: Breakfast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        showInitialBreakfast()
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        cardView.layer.cornerRadius = 16
        cardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.16).cgColor
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardView.layer.shadowRadius = 12
        
        breakfastImageView.contentMode = .scaleAspectFit
        breakfastImageView.clipsToBounds = true
        breakfastImageView.layer.cornerRadius = 12
        
        randomizeButton.layer.cornerRadius = 8
        randomizeButton.setTitle("Randomize", for: .normal)
        
        detailsContainer.layer.cornerRadius = 12
        detailsContainer.clipsToBounds = true
    }
    
    private func showInitialBreakfast() {
        if let first = breakfasts.randomElement() {
            updateUI(with: first)
        }
    }
    
    // MARK: - Actions
    @IBAction func randomizeTapped(_ sender: UIButton) {
        guard !breakfasts.isEmpty else { return }
        
        var newItem: Breakfast
        repeat {
            newItem = breakfasts.randomElement()!
        } while newItem.id == current?.id && breakfasts.count > 1
        
        updateUI(with: newItem)
    }
    
    // MARK: - UI Update
    private func updateUI(with breakfast: Breakfast) {
        current = breakfast
        
        titleLabel.text = breakfast.title
        breakfastImageView.image = UIImage(named: breakfast.imageName)
        timelabel.text = "\(breakfast.prepTimeMinutes) min"
        difficultyLabel.text = breakfast.difficulty.rawValue
        typeLabel.text = breakfast.type.rawValue
        
        let ingredientsText = breakfast.ingredients
            .map { "\($0.item): \($0.quantity) \($0.unit)" }
            .joined(separator: "\n")
        ingredientsTextView.text = ingredientsText
    }
}

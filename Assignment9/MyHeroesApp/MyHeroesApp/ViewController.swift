import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroCover: UIImageView!
    
    @IBOutlet weak var intLabel: UILabel!
    @IBOutlet weak var strLabel: UILabel!
    @IBOutlet weak var speLabel: UILabel!
    @IBOutlet weak var durLabel: UILabel!
    @IBOutlet weak var powLabel: UILabel!
    @IBOutlet weak var comLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var service = HeroService()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
        setupRefreshControl()
    }
    
    @IBAction private func getHero() {
        Task { @MainActor in
            guard let hero = try? await service.fetchHero() else { return }
            updateUI(with: hero)
        }
    }
    
    private func updateUI(with hero: HeroModel) {
        heroName.text = hero.name
        heroCover.kf.setImage(with: URL(string: hero.images.md))
        
        intLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
        strLabel.text = "Strength: \(hero.powerstats.strength)"
        speLabel.text = "Speed: \(hero.powerstats.speed)"
        durLabel.text = "Durability: \(hero.powerstats.durability)"
        powLabel.text = "Power: \(hero.powerstats.power)"
        comLabel.text = "Combat: \(hero.powerstats.combat)"
        
    }
    
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshHero), for: .valueChanged)
        scrollView.refreshControl = refreshControl
    }
    
    @objc private func refreshHero() {
        Task { @MainActor in
            guard let hero = try? await service.fetchHero() else { return }
            updateUI(with: hero)
            
            scrollView.refreshControl?.endRefreshing()
        }
    }
}

extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(hero: HeroModel,imageData: Data) {
        updateUI(with: hero)
    }
}


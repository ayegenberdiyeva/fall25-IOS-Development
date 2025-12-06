import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroCover: UIImageView!
    
    var service = HeroService()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
    }
    
    @IBAction private func getHeroes() {
        Task { @MainActor in
            guard let model = try? await service.fetchHero() else { return }
            heroName.text = model.name
            heroCover.kf.setImage(with: URL(string: model.images.md))
        }
    }
}

extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(hero: HeroModel,imageData: Data) {
        heroName.text = hero.name
        heroCover.image = UIImage(data: imageData)
    }
}


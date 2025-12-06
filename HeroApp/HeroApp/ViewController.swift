//
//  ViewController.swift
//  HeroApp
//
//  Created by Arman Myrzakanurov on 20.11.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroCover: UIImageView!

    var service = HeroService()
    var modernService = HeroServiceModern()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
    }

    @IBAction private func getHeroes() {
        // Completion handlers via Closures
        let randomId = Int.random(in: 1...563)
//        service.fetchHeroes(randomId: randomId)


        // Modern Concurrency - Async Await
        Task { @MainActor in
            guard let model = await try? modernService.fetchHero() else { return }
            heroName.text = model.name
            heroCover.kf.setImage(with: URL(string: model.images.md))
        }

    }
}

extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel, imageData: Data) {
        heroName.text = model.name
        heroCover.image = UIImage(data: imageData)
    }
}

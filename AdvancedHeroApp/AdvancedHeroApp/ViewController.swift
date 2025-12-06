//
//  ViewController.swift
//  AdvancedHeroApp
//
//  Created by Arman Myrzakanurov on 27.11.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var coverImage: UIImageView!

    var heroService = HeroService()

    override func viewDidLoad() {
        super.viewDidLoad()
        heroService.delegate = self
        setupInitialHeroIfNeeded()
    }

    @IBAction private func rollDidTap() {
        heroService.fetchHero()
    }
}
extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel) {
        configure(model: model)
        storeLocally(model: model)
    }

    private func configure(model: HeroModel) {
        nameLabel.text = model.name
        coverImage.kf.setImage(with: URL(string: model.images.md))
    }

    private func storeLocally(model: HeroModel) {
//        UserDefaults.standard.set(name, forKey: "heroName")
        let heroData = try? PropertyListEncoder().encode(model)
        UserDefaults.standard.set(heroData, forKey: "heroData")
    }

    private func setupInitialHeroIfNeeded() {
        guard
            let heroData = UserDefaults.standard.data(forKey: "heroData"),
            let heroModel = try? PropertyListDecoder().decode(HeroModel.self, from: heroData)
        else {
            return
        }

        configure(model: heroModel)
    }
}

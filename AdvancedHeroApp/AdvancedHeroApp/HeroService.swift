//
//  HeroService.swift
//  AdvancedHeroApp
//
//  Created by Arman Myrzakanurov on 27.11.2025.
//

import Foundation
import Alamofire

nonisolated
struct HeroModel: Codable {
    let id: Int
    let name: String
    let images: HeroImage

    struct HeroImage: Codable {
        let md: String
    }
}

protocol HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel)
}

struct HeroService {

    var delegate: HeroServiceDelegate?

    func fetchHero() {
        let randomId = Int.random(in: 1...564)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        AF.request(urlString).responseDecodable(of: HeroModel.self) { response in
            switch response.result {
            case .success(let hero):
                delegate?.onHeroDidUpdate(model: hero)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}

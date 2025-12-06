//
//  HeroManager.swift
//  HeroApp
//
//  Created by Arman Myrzakanurov on 20.11.2025.
//

import Foundation

protocol HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel, imageData: Data)
}

struct HeroService {

    var delegate: HeroServiceDelegate?

    func fetchHeroes(randomId: Int) {
        let apiUrl = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        let session = URLSession(configuration: .default)

        guard let url = URL(string: apiUrl) else { return }

        let urlRequest = URLRequest(url: url)

        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error {
                print("Error: \(error)")
            }
            guard let data else { return }

            do {
                let model = try self.parseHeroModel(data: data)

                let imageUrl = URL(string: model.images.md)!
                let imageData = try! Data(contentsOf: imageUrl)

                DispatchQueue.main.async {
                    delegate?.onHeroDidUpdate(model: model, imageData: imageData)
                }

            } catch {
                print("Parsing error: \(error)")
            }
        }
        dataTask.resume()
    }

    private func parseHeroModel(data: Data) throws -> HeroModel {
        do {
            let model = try JSONDecoder().decode(HeroModel.self, from: data)
            return model
        } catch {
            throw error
        }
    }
}

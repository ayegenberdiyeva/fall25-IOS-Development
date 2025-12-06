import Foundation

protocol HeroServiceDelegate: AnyObject {
    func onHeroDidUpdate(hero: HeroModel,imageData: Data)
}

class HeroService {
    weak var delegate: HeroServiceDelegate?
    
    func fetchHero(maxAttempts: Int = 10) async throws -> HeroModel {
        for _ in 0..<maxAttempts {
            let randomId = Int.random(in: 1...563)
            let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
            
            guard let url = URL(string: urlString) else {
                throw NetworkError.invalidURL
            }
            
            let urlRequest = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            if let httpResp = response as? HTTPURLResponse {
                if httpResp.statusCode == 404 {
                    continue
                } else if (200..<300).contains(httpResp.statusCode) {
                    let heroModel = try JSONDecoder().decode(HeroModel.self, from: data)
                    return heroModel
                } else {
                    throw NetworkError.httpError(statusCode: httpResp.statusCode)
                }
            } else {
                let heroModel = try JSONDecoder().decode(HeroModel.self, from: data)
                return heroModel
            }
        }
        throw NetworkError.maxRetriesExceeded
    }
}

enum NetworkError: Error {
    case invalidURL
    case httpError(statusCode: Int)
    case maxRetriesExceeded
}

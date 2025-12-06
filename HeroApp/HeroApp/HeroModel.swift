//
//  HeroModel.swift
//  HeroApp
//
//  Created by Arman Myrzakanurov on 20.11.2025.
//


struct HeroModel: Decodable {
    let id: Int
    let name: String
    let images: HeroImage

    struct HeroImage: Decodable {
        let md: String
    }
}

//
//  StoreModel.swift
//  StoreApp
//
//  Created by M.Ömer Ünver on 28.08.2023.
//

import Foundation

struct StoreModel : Codable {
    let id : Int
    let title : String
    let price : Double
    let category : String
    let description : String
    let image : String
    let rating : rating
    private enum CodingKeys : String, CodingKey {
        case id
        case title
        case price
        case category
        case description
        case image
        case rating
    }
}

struct rating : Codable {
    let rate : Double
    let count: Int
}

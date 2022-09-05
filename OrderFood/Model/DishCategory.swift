//
//  DishCategory.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import Foundation
struct DishCategory: Codable {
    let id : String
    let name : String
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}

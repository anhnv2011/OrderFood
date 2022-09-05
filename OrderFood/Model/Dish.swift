//
//  Dish.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import Foundation
struct Dish: Codable {
    let id: String?
    let name : String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}

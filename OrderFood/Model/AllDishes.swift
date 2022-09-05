//
//  AllDishes.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import Foundation
struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}

//
//  ApiResponse.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import Foundation
struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}

//
//  ApiError.swift
//  OrderFood
//
//  Created by MAC on 8/26/22.
//

import Foundation
enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Unknow"
        case .invalidUrl:
            return "Check your url"
        case .serverError(let error):
            return error
        }
    }
}

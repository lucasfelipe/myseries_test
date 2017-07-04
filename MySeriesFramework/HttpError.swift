//
//  HttpError.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation

public enum HttpError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case methodNotFound
    case conflict
    case preconditionFailed
    case unprocessibleEntity
    case rateLimitExceeded
    case serverError
    case serverUnavailable
    case unknown
    
    init(rawValue: Int) {
        switch rawValue {
        case 400: self = .badRequest
        case 401: self = .unauthorized
        case 403: self = .forbidden
        case 404: self = .notFound
        case 405: self = .methodNotFound
        case 409: self = .conflict
        case 412: self = .preconditionFailed
        case 422: self = .unprocessibleEntity
        case 429: self = .rateLimitExceeded
        case 500: self = .serverError
        case 503, 504, 520, 521, 522: self = .serverUnavailable
        default: self = .unknown
        }
    }
}

//
//  EndPoint.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation
import Alamofire

public enum EndPoint: String, URLConvertible, CustomStringConvertible {
    
    
    static let defaultURL = "https://api.trakt.tv/"
    
    case authentication = "oauth/authorize"
    case token = "oauth/token"
    
    public func asURL() throws -> URL {
        return URL(string: self.description)!
    }
    
    public var description: String {
        switch self {
        case .authentication:
            return EndPoint.defaultURL + self.rawValue
        case .token:
            return EndPoint.defaultURL + self.rawValue
        }
    }
    
    
}

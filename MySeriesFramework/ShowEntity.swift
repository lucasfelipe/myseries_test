//
//  ShowEntity.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ShowEntity: Show, Mappable {
    public var title: String?
    public var year: Int?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        title <- map["title"]
        year <- map["year"]
    }
}

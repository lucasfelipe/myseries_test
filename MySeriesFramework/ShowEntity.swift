//
//  ShowEntity.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class ShowEntity: Object, Mappable {
    public dynamic var title: String?
    public let year: RealmOptional<Int> = RealmOptional<Int>()
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        title <- map["title"]
        year.value <- map["year"]
    }
    
    
    override public static func indexedProperties() -> [String] {
        return ["title"]
    }
}

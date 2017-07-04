//
//  AuthRQ.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation
import ObjectMapper

struct AuthRQ: Mappable {
    private var responseType: String = "code"
    var clientID: String?
    var redirectURI: String?
    
    init?(map: Map) {
        
    }
    
    init(with clientID: String, redirectURI: String) {
        self.clientID = clientID
        self.redirectURI = redirectURI
    }
    
    mutating func mapping(map: Map) {
        responseType <- map["response_type"]
        clientID <- map["client_id"]
        redirectURI <- map["redirect_uri"]
    }
}

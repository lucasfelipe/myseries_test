//
//  Result.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ResultWrapper<T: Mappable> {
    var result: [T]?
    var error: Error?
    
    public init(with result: [T]) {
        self.result = result
    }
    
    public init(with error: Error) {
        self.error = error
    }
}

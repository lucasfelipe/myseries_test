//
//  Result.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation

public enum Result<T, Error> {
    case success(T)
    case failure(Error)
}

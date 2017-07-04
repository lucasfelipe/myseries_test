//
//  Episode.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation

public protocol Episode {
    var season: Int? { get }
    var number: Int? { get }
    var title: String? { get }
}

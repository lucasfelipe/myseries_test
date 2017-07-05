//
//  File.swift
//  MySeries
//
//  Created by Dev on 05/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation

public protocol ListMySeriesOutputPresenter {
    func list(series: [GetMySeriesRS])
}

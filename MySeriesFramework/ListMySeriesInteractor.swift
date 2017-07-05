//
//  ListMySeriesInteractor.swift
//  MySeries
//
//  Created by Dev on 05/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation

public struct ListMySeriesInteractor {
    var presenterOutput: ListMySeriesOutputPresenter
    var repository: MySeriesRepository
    
    public init(presenterOutput: ListMySeriesOutputPresenter, repository: MySeriesRepository) {
        self.presenterOutput = presenterOutput
        self.repository = repository
    }
    
    public func list() {
        let mySeries = Array(self.repository.all())
        presenterOutput.list(series: mySeries)
        
    }
}

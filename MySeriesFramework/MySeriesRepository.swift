//
//  MySeriesRepository.swift
//  MySeries
//
//  Created by Dev on 05/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation
import RealmSwift

public protocol MySeriesRepository {
    func all() -> Results<GetMySeriesRS>
    func create(mySerie: GetMySeriesRS)
    func update(series: [GetMySeriesRS])
    func deleteAll()
}

open class MySeriesRepositoryStore: MySeriesRepository {

    private var series: Results<GetMySeriesRS>
    private var realmDB: Realm
    
    public init() {
        realmDB = try! Realm()
        series = realmDB.objects(GetMySeriesRS.self)
    }
    
    public func all() -> Results<GetMySeriesRS> {
        self.series = realmDB.objects(GetMySeriesRS.self)
        return series
    }
    
    public func create(mySerie: GetMySeriesRS) {
        try! realmDB.write { realmDB.add(mySerie) }
    }
    
    public func update(series: [GetMySeriesRS]) {
        let listToAdd = series.filter { !self.series.contains($0) }
        try! realmDB.write {
            realmDB.add(listToAdd)
        }
    }
    
    public func deleteAll() {
        try! realmDB.write {
            realmDB.deleteAll()
        }
    }
}



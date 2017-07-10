//
//  ListMySeriesDataSource.swift
//  MySeries
//
//  Created by Dev on 05/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import UIKit
import MySeriesFramework

class ListMySeriesDataSource: NSObject, UICollectionViewDataSource, ListMySeriesOutputPresenter {

    var mySeries: [GetMySeriesRS] = []
    let cellIdentifier = "mySeriesCell"
    
    override init() {
        super.init()
        ListMySeriesInteractor(presenterOutput: self, repository: MySeriesRepositoryStore()).list()
    }
    
    func list(series: [GetMySeriesRS]) {
        mySeries = series
    }
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mySeries.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MySeriesCollectionViewCell
        cell.show(serie: mySeries[indexPath.row])
        return cell
    }
    
}

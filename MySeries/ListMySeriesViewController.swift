//
//  ListMySeriesViewController.swift
//  MySeries
//
//  Created by Dev on 05/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import UIKit

class ListMySeriesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Properties
    var mySeriesDataSource: ListMySeriesDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configureDataSource()
        collectionView.reloadData()
    }
    
    private func configureDataSource() {
        self.mySeriesDataSource = ListMySeriesDataSource()
        if let mySeriesDataSource = self.mySeriesDataSource {
            collectionView.dataSource = mySeriesDataSource
        }
    }

}

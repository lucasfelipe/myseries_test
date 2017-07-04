//
//  ViewController.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import UIKit
import MySeriesFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let credentials = WSCredentials()
        
        let service = AuthenticationGatewayImpl()
        service.authenticate(with: credentials)
        
    }


}

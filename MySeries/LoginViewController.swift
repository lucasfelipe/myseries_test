//
//  ViewController.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import UIKit
import WebKit
import MySeriesFramework


class LoginViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let service: AuthenticationGateway = AuthenticationGatewayImpl()
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.receiveRedirect(notification:)), name: service.redirectNotification.name, object: nil)
        service.authenticate()
        
    }
    
    func receiveRedirect(notification: Notification) {
        let request = notification.object as! URLRequest
        webView.loadRequest(request)
    }

    

}

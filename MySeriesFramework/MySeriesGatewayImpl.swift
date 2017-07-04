//
//  AuthenticationGatewayImpl.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation
import OAuthSwift

public class MySeriesGatewayImpl: MySeriesGateway {
    
    private let headers: [String: String] = [
        "Content-Type": "application/json"
    ]
    
    private let requester = AlamofireHttpRequester()
    
    public init() {}
    
   public func authenticate(with credentials: WSCredentials) -> Void {
        let auth = OAuth2Swift(
            consumerKey: credentials.getClientID(),
            consumerSecret: credentials.getClientSecret(),
            authorizeUrl: EndPoint.authentication.description,
            responseType: "code")
        
        auth.authorize(withCallbackURL: URL(string: credentials.getRedirectURI())!, scope: "", state: "", success: { (credential, response, parameters) in
            print(credential.oauthToken)
        }) { (error) in
            print(error.localizedDescription)
        }
    
//        let url = URL(string: "https://api.trakt.tv/oauth/authorize?response_type=code&client_id=\(credentials.getClientID())&redirect_uri=\(credentials.getRedirectURI())")!
//        var request = URLRequest(url: url)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let response = response, let data = data {
//                print(response)
//                print(String(data: data, encoding: .utf8)!)
//            } else {
//                print(error?.localizedDescription)
//            }
//        }
//        
//        task.resume()
    }
    
    public func getMySeries(request: GetMySeriesRQ, completion: @escaping (Result<GetMySeriesRS, HttpError>) -> Void) {
        
    }
}

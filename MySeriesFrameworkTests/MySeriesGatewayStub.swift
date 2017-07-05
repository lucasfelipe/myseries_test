//
//  MySeriesGatewayStub.swift
//  MySeries
//
//  Created by Dev on 05/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation
@testable import MySeriesFramework

class MySeriesGatewayStub: MySeriesGateway {
    
    func authenticate(with credentials: WSCredentials) {
        
    }
    
    func getMySeries(request: GetMySeriesRQ, completion: @escaping (Result<[GetMySeriesRS], HttpError>) -> Void) {
        
    }
    
}

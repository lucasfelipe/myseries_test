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
    
    func authenticate(completion: @escaping (_ html: String) -> Void) {
        
    }
    
    func getMySeries(request: GetMySeriesRQ, completion: @escaping (ResultWrapper<GetMySeriesRS>) -> Void) {
        
    }
    
}

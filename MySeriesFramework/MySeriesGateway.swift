//
//  AuthenticationProtocol.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation

public protocol MySeriesGateway {
     func authenticate(completion: @escaping (_ html: String) -> Void) -> Void
     func getMySeries(request: GetMySeriesRQ, completion: @escaping (ResultWrapper<GetMySeriesRS>) -> Void)
}

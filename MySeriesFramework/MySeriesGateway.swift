//
//  AuthenticationProtocol.swift
//  MySeries
//
//  Created by Dev on 04/07/17.
//  Copyright © 2017 Wooba. All rights reserved.
//

import Foundation

public protocol MySeriesGateway {
    func authenticate(with credentials: WSCredentials) -> Void
    func getMySeries(request: GetMySeriesRQ, completion: @escaping (Result<GetMySeriesRS, HttpError>) -> Void)
}
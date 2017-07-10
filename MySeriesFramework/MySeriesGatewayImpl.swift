import Foundation
import OAuthSwift
import Alamofire

public class MySeriesGatewayImpl: MySeriesGateway {
    
    private let headers: [String: String] = [
        "Content-Type": "application/json"
    ]
    
    private let requester = AlamofireHttpRequester()
    
    public init() {}
    
    public func getMySeries(request: GetMySeriesRQ, completion: @escaping (ResultWrapper<GetMySeriesRS>) -> Void) {
//        self.requester.send(url: EndPoint.myShows.description,
//                            method: .get, parameters: request,
//                            encoding: URLEncoding.methodDependent) { (result: ResultWrapper<GetMySeriesRS>) in
//            completion(result)
//        }
    }
}

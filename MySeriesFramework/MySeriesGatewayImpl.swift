import Foundation
import OAuthSwift
import Alamofire

public class MySeriesGatewayImpl: MySeriesGateway {
    
    private let headers: [String: String] = [
        "Content-Type": "application/json"
    ]
    
    private var credentials = WSCredentials()
    
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

extension Date {
    func toString() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-mm-dd"
        format.dateStyle = DateFormatter.Style.short
        return format.string(from: self)
    }
}

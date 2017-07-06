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
    
    public func authenticate(completion: @escaping (_ html: String) -> Void) -> Void {
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
//                completion(String(data: data, encoding: .utf8)!)
//            } else {
//                print(error!.localizedDescription)
//            }
//        }
//        
//        task.resume()
    }
    
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

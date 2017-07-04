import Foundation
import Alamofire
import ObjectMapper

class AlamofireHttpRequester: SessionDelegate {
    
    private var session: Alamofire.SessionManager?
    private let headers = ["Content-type": "application/json"]
    
    override init() {
        super.init()
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 60
        config.timeoutIntervalForResource = 60
        session = Alamofire.SessionManager(configuration: config, delegate: self, serverTrustPolicyManager: nil)
    }
    
    func send<Request, Response>(url: String, method: HTTPMethod, parameters: Request, completion: @escaping (Result<Response, HttpError>) -> Void) where Request: Mappable, Response: Mappable {
        let backgroundQueue = DispatchQueue.global(qos: .background)
        backgroundQueue.async {
            let params = parameters.toJSON()
            self.session?.request(url, method: method, parameters: params, encoding: Alamofire.JSONEncoding.default,
                                  headers: self.headers).responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success:
                    if let httpResult = response.response {
                        let url = httpResult.url
                        let cookies = HTTPCookie.cookies(withResponseHeaderFields: httpResult.allHeaderFields as! [String : String], for: url!)
                        if let cookiesStorage = Alamofire.SessionManager.default.session.configuration.httpCookieStorage {
                            cookiesStorage.setCookies(cookies, for: url!, mainDocumentURL: nil)
                        }
                    }
                    
                    if let objectResponse = Mapper<Response>().map(JSONObject: response.result.value) {
                        DispatchQueue.main.async {
                            completion(Result.success(objectResponse))
                        }
                    } else { completion(Result.failure(HttpError.unknown)) }
                    
                case let .failure(error):
                    print(error.localizedDescription)
                    completion(Result.failure(HttpError(rawValue: response.response!.statusCode)))
                }
            })
        }
    }
    
}

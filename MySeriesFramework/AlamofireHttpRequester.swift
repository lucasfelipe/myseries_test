import Foundation
import Alamofire
import ObjectMapper

class AlamofireHttpRequester: SessionDelegate {
    
    private var session: Alamofire.SessionManager!
    private let headers = ["Content-type": "application/json"]
    
    override init() {
        super.init()
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 60
        config.timeoutIntervalForResource = 60
        session = Alamofire.SessionManager(configuration: config, delegate: self, serverTrustPolicyManager: nil)
    }
    
    func send<Request, Response>(url: String, method: HTTPMethod, parameters: Request, encoding: ParameterEncoding = JSONEncoding.default,
              completion: @escaping (Result<Response, HttpError>) -> Void) where Request: Mappable, Response: Mappable {
        let backgroundQueue = DispatchQueue.global(qos: .background)
        backgroundQueue.async {
            let params = parameters.toJSON()
            self.doRequest(url: url, method: method, params: params, encoding: encoding, success: { (result) in
                if let object = Mapper<Response>().map(JSONObject: result) {
                    completion(Result.success(object))
                } else { completion(Result.failure(HttpError.unknown)) }
            }, failure: { (error) in
                completion(Result.failure(error))
            })
        }
    }
    
    func sendForArray<Request, Response>(url: String, method: HTTPMethod, parameters: Request, encoding: ParameterEncoding = JSONEncoding.default,
              completion: @escaping (Result<[Response], HttpError>) -> Void) where Request: Mappable, Response: Mappable {
        let backgroundQueue = DispatchQueue.global(qos: .background)
        backgroundQueue.async {
            let params = parameters.toJSON()
            self.doRequest(url: url, method: method, params: params, encoding: encoding, success: { (result) in
                if let object = Mapper<Response>().mapArray(JSONObject: result) {
                    completion(Result.success(object))
                } else { completion(Result.failure(HttpError.unknown)) }
            }, failure: { (error) in
                completion(Result.failure(error))
            })
        }
    }
    
    private func doRequest(url: String, method: HTTPMethod,
                           params: Parameters? = nil, encoding: ParameterEncoding, success: @escaping (Any?) -> Void,
                           failure: @escaping (HttpError) -> Void) {
        self.session.request(url, method: method,
                             parameters: params, encoding: encoding, headers: self.headers).responseJSON { (response) in
                                switch response.result {
                                case .success:
                                    if let httpResult = response.response {
                                        let url = httpResult.url
                                        let cookies = HTTPCookie.cookies(withResponseHeaderFields: httpResult.allHeaderFields as! [String : String], for: url!)
                                        if let cookiesStorage = Alamofire.SessionManager.default.session.configuration.httpCookieStorage {
                                            cookiesStorage.setCookies(cookies, for: url!, mainDocumentURL: nil)
                                        }
                                    }
                                    DispatchQueue.main.async {
                                        success(response.result.value)
                                    }
                                case let .failure(error):
                                    print(error.localizedDescription)
                                    failure(HttpError(rawValue: response.response!.statusCode))
                                }
        }
    }
    
}

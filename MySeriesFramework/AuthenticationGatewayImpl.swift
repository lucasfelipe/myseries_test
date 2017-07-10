
import Foundation
import ObjectMapper

public class AuthenticationGatewayImpl: NSObject, AuthenticationGateway, URLSessionTaskDelegate {

    private var credentials = WSCredentials()
    private var urlSession: URLSession!
    private var tokenRepository: TokenRepository = TokenRepositoryStore()
    
    public override init() {
        super.init()
        let config = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }
    
    public func authenticate() {
        let stringURL = EndPoint.authentication.description + ("?response_type=code&client_id=\(credentials.getClientID())&redirect_uri=\(credentials.getRedirectURI())")
        let url = URL(string: stringURL)!
        let request = URLRequest(url: url)
        
        self.urlSession.dataTask(with: request).resume()
        
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask,
                           willPerformHTTPRedirection response: HTTPURLResponse,
                           newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        
        NotificationCenter.default.post(name: MySeriesNotification.AuthNotification, object: request)
        
    }
    
    public func getToken(_ url: URL) {
        if let code = url.absoluteString.components(separatedBy: "?code=").last {
            guard let urlGetToken = URL(string: EndPoint.token.description) else { return }
            self.credentials.setCode(code: code)
            
            var request = URLRequest(url: urlGetToken)
            request.addValue("application/json", forHTTPHeaderField: "Content-type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.httpMethod = "POST"
            request.httpBody = self.credentials.toJSONString()?.data(using: .utf8)
            
            self.urlSession.dataTask(with: request, completionHandler: { (responseData, response, error) in
                guard let tokenString = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments) as! [String: Any] else { return }
                guard let token = Mapper<Token>().map(JSONObject: tokenString) else { return }
                DispatchQueue.main.async {
                    self.tokenRepository.createOrUpdate(token: token)
                    NotificationCenter.default.post(name: MySeriesNotification.StopAuthNotification, object: nil)
                }
            }).resume()
            
        }
        
    }
    
}

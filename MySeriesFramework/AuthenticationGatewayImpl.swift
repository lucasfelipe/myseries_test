
import Foundation

public class AuthenticationGatewayImpl: NSObject, AuthenticationGateway, URLSessionTaskDelegate {

    private let credentials = WSCredentials()
    private var urlSession: URLSession!
    
    public var redirectNotification: Notification!
    public var stopNotification: Notification!
    
    
    public override init() {
        super.init()
        let config = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        self.redirectNotification = Notification(name: Notification.Name(rawValue: "REDIRECT"), object: nil, userInfo: nil)
        self.stopNotification = Notification(name: Notification.Name(rawValue: "STOP"), object: nil, userInfo: nil)
    }
    
    public func authenticate() {
        let url = URL(string: "https://api.trakt.tv/oauth/authorize?response_type=code&client_id=\(credentials.getClientID())&redirect_uri=\(credentials.getRedirectURI())")!
        let request = URLRequest(url: url)
        
        self.urlSession.dataTask(with: request).resume()
        
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        print(response.allHeaderFields)
        print(response.statusCode)
        print(response.url!.absoluteString)
        print(request.allHTTPHeaderFields!)
        print(request.httpMethod!)
        print(request.url!.absoluteString)
        NotificationCenter.default.post(name: self.redirectNotification.name, object: request)
        
    }
    
}

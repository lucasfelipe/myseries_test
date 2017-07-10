
import Foundation
import Alamofire

public enum EndPoint: String, URLConvertible, CustomStringConvertible {
    
    
    static let defaultURL = "https://api.trakt.tv/"
    
    case authentication = "oauth/authorize"
    case token = "oauth/token"
    case myShows = "calendars/my/shows/"
    
    public func asURL() throws -> URL {
        return URL(string: self.description)!
    }
    
    public var description: String {
        switch self {
        case .authentication:
            return EndPoint.defaultURL + self.rawValue
        case .token:
            return EndPoint.defaultURL + self.rawValue
        case .myShows:
            return EndPoint.defaultURL + self.rawValue
        }
    }
    
    
    public func withParams(params: [String]) -> String {
        let str = description + params.joined(separator: "/")
        return str
    }
    
}

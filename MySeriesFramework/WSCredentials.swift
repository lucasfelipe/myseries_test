
import Foundation
import ObjectMapper

public struct WSCredentials: Mappable {
    private var code: String = "code"
    private var clientID = "fe2e45411d70786aa9a6e6aa2d6c2d1e535e664e65e93be6230337fe0ce62fd0"
    private var clientSecret = "035993f6d77e039ebba06b5bd00104c49ff316e8a0a8538697921e381ba425a9"
    private var redirectURI = "com.br.myseries.callback"
    private var grantType = GrantType.authorization
    
    public init() {}
    
    public init?(map: Map) {
    }
    
    mutating public func mapping(map: Map) {
        code <- map["code"]
        clientID <- map["client_id"]
        clientSecret <- map["client_secret"]
        redirectURI <- map["redirect_uri"]
        grantType <- map["grant_type"]
    }
    
    func getClientID() -> String {
        return self.clientID
    }
    
    func getClientSecret() -> String {
        return self.clientSecret
    }
    
    func getRedirectURI() -> String {
        return self.redirectURI
    }
    
    func getResponseType() -> String {
        return self.code;
    }
}

enum GrantType: String {
    case authorization = "authorization_code"
    case clientCredentials = "client_credentials"
}

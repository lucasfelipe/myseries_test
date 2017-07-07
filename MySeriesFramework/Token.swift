
import Foundation
import ObjectMapper
import RealmSwift

class Token: Object, Mappable {
    dynamic var accessToken: String?
    dynamic var tokenType: String?
    let expiresIn: RealmOptional<Int> = RealmOptional<Int>()
    dynamic var refreshToken: String?
    dynamic var scope: String?
    dynamic var createdAt: Date?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        accessToken <- map["access_token"]
        tokenType <- map["token_type"]
        expiresIn.value <- map["expires_in"]
        refreshToken <- map["refresh_token"]
        scope <- map["scope"]
        createdAt <- (map["created_at"], DateTransform())
    }
}

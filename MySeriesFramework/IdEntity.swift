
import Foundation
import RealmSwift
import ObjectMapper

public class IdEntity: Object, Mappable {
    public let trakt: RealmOptional<Int> = RealmOptional<Int>()
    public let tvdb: RealmOptional<Int> = RealmOptional<Int>()
    public dynamic var imdb: String?
    public let tmdb: RealmOptional<Int> = RealmOptional<Int>()
    public let tvrage: RealmOptional<Int> = RealmOptional<Int>()
    
    public required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        trakt.value <- map["trakt"]
        tvdb.value <- map["tvdb"]
        imdb <- map["imdb"]
        tmdb.value <- map["tmdb"]
        tvrage.value <- map["tvrage"]
    }
}

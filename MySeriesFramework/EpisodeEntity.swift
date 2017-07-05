import Foundation
import ObjectMapper
import RealmSwift

public class EpisodeEntity: Object, Mappable {
    public let season: RealmOptional<Int> = RealmOptional<Int>()
    public let number: RealmOptional<Int> = RealmOptional<Int>()
    public dynamic var title: String?
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        season.value <- map["season"]
        number.value <- map["number"]
        title <- map["title"]
    }
}

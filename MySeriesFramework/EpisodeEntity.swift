import Foundation
import ObjectMapper

public struct EpisodeEntity: Episode, Mappable {
    public var season: Int?
    public var number: Int?
    public var title: String?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        season <- map["season"]
        number <- map["number"]
        title <- map["title"]
    }
}

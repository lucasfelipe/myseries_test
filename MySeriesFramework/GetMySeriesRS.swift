import Foundation
import ObjectMapper

public struct GetMySeriesRS: Mappable {
    var firstAired: Date?
    var episode: EpisodeEntity?
    var show: ShowEntity?
    
    public init?(map: Map) {
        
    }
    
    public mutating func mapping(map: Map) {
        firstAired <- map["first_aired"]
        episode <- map["episode"]
        show <- map["show"]
    }
}
